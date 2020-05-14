Content-Type: multipart/mixed; boundary="===============6791625811076160958=="
MIME-Version: 1.0
From: Georgi Djakov <georgi.djakov@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [vireshk-pm:opp/linux-next 4/9] drivers/opp/core.c:1076: undefined reference to `icc_put'
Date: Thu, 14 May 2020 09:24:54 +0300
Message-ID: <d230ab5e-54a6-56f0-77fc-1cc16f24e387@linaro.org>
In-Reply-To: <20200513175845.GL4525@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6791625811076160958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/13/20 20:58, Matthias Kaehlcke wrote:
> On Thu, May 14, 2020 at 12:43:38AM +0800, kbuild test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git o=
pp/linux-next
>> head:   b9fd171ae7781c5eb2ecc5f3a59cb41b33c05be0
>> commit: 6b6c64a05ad880d425db18c52b7ff79d4be148a6 [4/9] OPP: Add support =
for parsing interconnect bandwidth
>> config: x86_64-randconfig-a002-20200513 (attached as .config)
>> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
>> reproduce:
>>         git checkout 6b6c64a05ad880d425db18c52b7ff79d4be148a6
>>         # save the attached .config to linux build tree
>>         make ARCH=3Dx86_64 =

>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>> ld: drivers/opp/core.o: in function `_opp_table_kref_release':
>>>> drivers/opp/core.c:1076: undefined reference to `icc_put'
>> ld: drivers/opp/of.o: in function `dev_pm_opp_of_find_icc_paths':
>>>> drivers/opp/of.c:364: undefined reference to `of_icc_get_by_index'
>>>> ld: drivers/opp/of.c:383: undefined reference to `icc_put'
> =

> the .config has 'CONFIG_INTERCONNECT=3Dm' which supposedly is verboten by
> =

>   depends on INTERCONNECT || !INTERCONNECT
> =

> in drivers/opp/Kconfig
> =

> I stumbled across this during the review and I'm still doubtful that
> depending on an option actually means that it is builtin.
> =

> A couple of drivers use something like
> =

>   depends on INTERCONNECT !=3D m
> =

> However this still doesn't fix the build error. It seems the dependency is
> ignored because PM_DEVFREQ enables OPP:
> =

>   Selected by [y]:                                                       =
                                                                           =
                                                                 =E2=94=82
>   =E2=94=82   - PM_DEVFREQ [=3Dy]

One option to resolve this would be to ensure that all kconfig options which
select PM_OPP have also depends on INTERCONNECT || !INTERCONNECT. But as th=
is
would mean patches across several different subsystems, maybe we can use
IS_REACHABLE() when calling the interconnect APIs from OPP and fix it with a
follow-up patch like the one below. I will do some testing and see if it wo=
rks.

---8<---
diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 4cf988ff0aff..4bda37374a3d 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -909,7 +909,7 @@ int dev_pm_opp_set_rate(struct device *dev, unsigned lo=
ng
target_freq)
 			dev_err(dev, "Failed to set required opps: %d\n", ret);
 	}

-	if (!ret && opp_table->paths) {
+	if (!ret && opp_table->paths && IS_REACHABLE(CONFIG_INTERCONNECT)) {
 		for (i =3D 0; i < opp_table->path_count; i++) {
 			ret =3D icc_set_bw(opp_table->paths[i],
 					 opp->bandwidth[i].avg,
@@ -1082,7 +1082,7 @@ static void _opp_table_kref_release(struct kref *kref)
 	if (!IS_ERR(opp_table->clk))
 		clk_put(opp_table->clk);

-	if (opp_table->paths) {
+	if (opp_table->paths && IS_REACHABLE(CONFIG_INTERCONNECT)) {
 		for (i =3D 0; i < opp_table->path_count; i++)
 			icc_put(opp_table->paths[i]);
 		kfree(opp_table->paths);
diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index b47d0465fe4b..fc94cc59c757 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -332,6 +332,7 @@ static int _of_opp_alloc_required_opps(struct opp_table
*opp_table,
 	return ret;
 }

+#if IS_REACHABLE(CONFIG_INTERCONNECT)
 int dev_pm_opp_of_find_icc_paths(struct device *dev,
 				 struct opp_table *opp_table)
 {
@@ -400,6 +401,7 @@ int dev_pm_opp_of_find_icc_paths(struct device *dev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_of_find_icc_paths);
+#endif

 static bool _opp_is_supported(struct device *dev, struct opp_table *opp_ta=
ble,
 			      struct device_node *np)
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index d5c4a329321d..489c9b9a7535 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -372,7 +372,11 @@ int dev_pm_opp_of_get_sharing_cpus(struct device *cpu_=
dev,
struct cpumask *cpuma
 struct device_node *dev_pm_opp_of_get_opp_desc_node(struct device *dev);
 struct device_node *dev_pm_opp_get_of_node(struct dev_pm_opp *opp);
 int of_get_required_opp_performance_state(struct device_node *np, int inde=
x);
+#if IS_REACHABLE(CONFIG_INTERCONNECT)
 int dev_pm_opp_of_find_icc_paths(struct device *dev, struct opp_table *opp=
_table);
+#else
+static inline int dev_pm_opp_of_find_icc_paths(struct device *dev, struct
opp_table *opp_table) { return 0; }
+#endif
 void dev_pm_opp_of_register_em(struct cpumask *cpus);
 #else
 static inline int dev_pm_opp_of_add_table(struct device *dev)
--===============6791625811076160958==--

