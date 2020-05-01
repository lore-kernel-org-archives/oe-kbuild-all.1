Content-Type: multipart/mixed; boundary="===============7616919872330870904=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lkp] [+3086 bytes kernel size regression] [i386-tinyconfig] [3a4ac121c2] x86/perf: Add hardware performance events support for Zhaoxin CPU.
Date: Sat, 02 May 2020 01:43:46 +0800
Message-ID: <5eac5fd2.4a/ZewL0k6WQIF1L%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7616919872330870904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed a +3086 bytes kernel size regression due to commit:

commit: 3a4ac121c2cacbf97d493fa3bc42ead88657abe4 (x86/perf: Add hardware pe=
rformance events support for Zhaoxin CPU.)
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core

Details as below (size data is obtained by `nm --size-sort vmlinux`):

87cfeb19: Merge tag 'perf-core-for-mingo-5.8-20200420' of git://git.kernel.=
org/pub/scm/linux/kernel/git/acme/linux into perf/core
3a4ac121: x86/perf: Add hardware performance events support for Zhaoxin CPU.

+------------------------------------+----------+----------+-------+
|               symbol               | 87cfeb19 | 3a4ac121 | delta |
+------------------------------------+----------+----------+-------+
| bzImage                            | 439232   | 440192   | 960   |
| nm.T.zhaoxin_pmu_init              | 0        | 877      | 877   |
| nm.t.zhaoxin_pmu_handle_irq        | 0        | 480      | 480   |
| nm.t.zxd_hw_cache_event_ids        | 0        | 336      | 336   |
| nm.t.zxe_hw_cache_event_ids        | 0        | 336      | 336   |
| nm.t.zhaoxin_pmu_enable_event      | 0        | 292      | 292   |
| nm.d.zxd_event_constraints         | 0        | 160      | 160   |
| nm.t.zhaoxin_pmu_disable_event     | 0        | 143      | 143   |
| nm.d.zx_pmon_event_map             | 0        | 80       | 80    |
| nm.d.zxc_event_constraints         | 0        | 80       | 80    |
| nm.t.zhaoxin_arch_events_quirk     | 0        | 70       | 70    |
| nm.t.zhaoxin_get_event_constraints | 0        | 66       | 66    |
| nm.t.zx_arch_events_map            | 0        | 56       | 56    |
| nm.d.zx_arch_formats_attr          | 0        | 24       | 24    |
| nm.t.zhaoxin_pmu_enable_all        | 0        | 22       | 22    |
| nm.t.zhaoxin_pmu_event_map         | 0        | 21       | 21    |
| nm.t.zhaoxin_event_sysfs_show      | 0        | 19       | 19    |
| nm.t.init_hw_perf_events           | 726      | 739      | 13    |
| nm.t.zhaoxin_pmu_disable_all       | 0        | 11       | 11    |
| nm.T.intel_pmu_init                | 4196     | 4197     | 1     |
| nm.R.linux_banner                  | 164      | 163      | -1    |
+------------------------------------+----------+----------+-------+



Thanks,
Kbuild test robot

--===============7616919872330870904==--

