Content-Type: multipart/mixed; boundary="===============6502630264115449996=="
MIME-Version: 1.0
From: Alex Elder <elder@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] rpmsg: glink: add a header file
Date: Tue, 05 Jan 2021 22:19:19 -0600
Message-ID: <f2325ccf-3d59-0c26-9371-20734cc61376@linaro.org>
In-Reply-To: <X/U2MmdpU96WdUGw@builder.lan>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6502630264115449996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/5/21 10:01 PM, Bjorn Andersson wrote:
> On Tue 05 Jan 20:42 CST 2021, kernel test robot wrote:
> =

>> Hi Alex,
>>
>> I love your patch! Yet something to improve:
>>
> =

> Alex, this turns out to be an existing problem. Please have a look at my
> proposal for a fix here:
> =

> https://lore.kernel.org/linux-remoteproc/20210106035905.4153692-1-bjorn.a=
ndersson(a)linaro.org/T/#u
> =

> If you like it I can merge it and then apply this patch on top.

Go ahead and merge your patch.  If you are sure mine will
work afterward (I think it will) I would be happy to have
you accept that as well.  Thanks.

					-Alex

> =

> Thanks,
> Bjorn
> =

>> [auto build test ERROR on linus/master]
>> [also build test ERROR on v5.11-rc2 next-20210104]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Alex-Elder/rpmsg-glink-=
add-a-header-file/20210106-080024
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
>> config: x86_64-randconfig-s021-20210106 (attached as .config)
>> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>> reproduce:
>>          # apt-get install sparse
>>          # sparse version: v0.6.3-208-g46a52ca4-dirty
>>          # https://github.com/0day-ci/linux/commit/333b19e6f90b89d18b94b=
e972c0823959373dad8
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review Alex-Elder/rpmsg-glink-add-a-h=
eader-file/20210106-080024
>>          git checkout 333b19e6f90b89d18b94be972c0823959373dad8
>>          # save the attached .config to linux build tree
>>          make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' =
ARCH=3Dx86_64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/rpmsg/qcom_glink_ssr.c:65:6: error: redefinition of 'qcom_glin=
k_ssr_notify'
>>        65 | void qcom_glink_ssr_notify(const char *ssr_name)
>>           |      ^~~~~~~~~~~~~~~~~~~~~
>>     In file included from drivers/rpmsg/qcom_glink_ssr.c:11:
>>     include/linux/rpmsg/qcom_glink.h:27:20: note: previous definition of=
 'qcom_glink_ssr_notify' was here
>>        27 | static inline void qcom_glink_ssr_notify(const char *ssr_nam=
e) {}
>>           |                    ^~~~~~~~~~~~~~~~~~~~~
>>
>>
>> vim +/qcom_glink_ssr_notify +65 drivers/rpmsg/qcom_glink_ssr.c
>>
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22 =
 60
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22 =
 61  /**
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22 =
 62   * qcom_glink_ssr_notify() - notify GLINK SSR about stopped remoteproc
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22 =
 63   * @ssr_name:	name of the remoteproc that has been stopped
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22 =
 64   */
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22 =
@65  void qcom_glink_ssr_notify(const char *ssr_name)
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22 =
 66  {
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22 =
 67  	blocking_notifier_call_chain(&ssr_notifiers, 0, (void *)ssr_name);
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22 =
 68  }
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22 =
 69  EXPORT_SYMBOL_GPL(qcom_glink_ssr_notify);
>> 5d1f2e3c8090c07 drivers/soc/qcom/glink_ssr.c Bjorn Andersson 2020-04-22 =
 70
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =

>=20

--===============6502630264115449996==--

