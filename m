Content-Type: multipart/mixed; boundary="===============6621372823087778699=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 13096/14167] drivers/cpufreq/cpufreq_stats.c:63:10: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'.
Date: Fri, 09 Oct 2020 21:40:44 +0800
Message-ID: <20201009134044.GK8133@xsang-OptiPlex-9020>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6621372823087778699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8b787da7ba8cd2383988480d282ec1abc3917892
commit: 40c3bd4cfa6fe5756344709b98611a1ddd15bf9d [13096/14167] cpufreq: sta=
ts: Defer stats update to cpufreq_stats_record_transition()
:::::: branch date: 24 hours ago
:::::: commit date: 3 days ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +63 drivers/cpufreq/cpufreq_stats.c

ee7930ee27fe524 Markus Mayer   2016-11-07  55  =

0a829c5afde8e9e Dave Jones     2009-01-18  56  static ssize_t show_total_tr=
ans(struct cpufreq_policy *policy, char *buf)
^1da177e4c3f415 Linus Torvalds 2005-04-16  57  {
40c3bd4cfa6fe57 Viresh Kumar   2020-10-05  58  	struct cpufreq_stats *stats=
 =3D policy->stats;
40c3bd4cfa6fe57 Viresh Kumar   2020-10-05  59  =

40c3bd4cfa6fe57 Viresh Kumar   2020-10-05  60  	if (READ_ONCE(stats->reset_=
pending))
40c3bd4cfa6fe57 Viresh Kumar   2020-10-05  61  		return sprintf(buf, "%d\n"=
, 0);
40c3bd4cfa6fe57 Viresh Kumar   2020-10-05  62  	else
40c3bd4cfa6fe57 Viresh Kumar   2020-10-05 @63  		return sprintf(buf, "%d\n"=
, stats->total_trans);
^1da177e4c3f415 Linus Torvalds 2005-04-16  64  }
10b818211d04805 Viresh Kumar   2019-02-01  65  cpufreq_freq_attr_ro(total_t=
rans);
^1da177e4c3f415 Linus Torvalds 2005-04-16  66  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6621372823087778699==--

