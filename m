Content-Type: multipart/mixed; boundary="===============5149306003659825260=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] kernel: allow to configure PREEMPT_NONE, PREEMPT_VOLUNTARY on kernel command line
Date: Wed, 07 Oct 2020 17:53:49 +0200
Message-ID: <20201007155349.GA4967@dhcp22.suse.cz>
In-Reply-To: <202010072327.l6NN6vIy-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5149306003659825260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 07-10-20 23:41:30, kernel test robot wrote:
> Hi Michal,
> =

> [FYI, it's a private test report for your RFC patch.]
> [auto build test ERROR on gpio/for-next]
> [also build test ERROR on tip/sched/core linus/master v5.9-rc8 next-20201=
007]
> [cannot apply to linux/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]

Thanks for the report. So this is CONFIG_PREEMPT=3Dy and I haven't tested
with that option for this RFC TBH. But the fix should be trivial.

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 94238df64afc..d2d37bd5ecd5 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -203,6 +203,9 @@ DECLARE_STATIC_KEY_FALSE(preempt_voluntary_key);
 extern int _cond_resched(void);
 # define might_resched() \
 	do { if (static_branch_likely(&preempt_voluntary_key)) _cond_resched(); }=
 while (0)
+#else
+# define might_resched() \
+	do { } while (0)
 #endif
 =

 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
-- =

Michal Hocko
SUSE Labs
--===============5149306003659825260==--

