Content-Type: multipart/mixed; boundary="===============3146542423047672369=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [s390:fixes 4/6] arch/s390/kernel/processor.c:158:42: error: implicit declaration of function 'topology_book_id'; did you mean 'topology_core_id'?
Date: Tue, 11 Feb 2020 04:36:09 +0800
Message-ID: <202002110402.y8ETTTo6%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3146542423047672369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git fixes
head:   2ae14b57fa3e7c783ba36de4965634839d706690
commit: 5ef2d0f973e7b1ff50a12c48b0e8214fdc5e5182 [4/6] s390/cpuinfo: add sy=
stem topology information
config: s390-allnoconfig (attached as .config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 5ef2d0f973e7b1ff50a12c48b0e8214fdc5e5182
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Ds390 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/s390/kernel/processor.c: In function 'show_cpu_topo':
>> arch/s390/kernel/processor.c:158:42: error: implicit declaration of func=
tion 'topology_book_id'; did you mean 'topology_core_id'? [-Werror=3Dimplic=
it-function-declaration]
     seq_printf(m, "book id         : %d\n", topology_book_id(n));
                                             ^~~~~~~~~~~~~~~~
                                             topology_core_id
>> arch/s390/kernel/processor.c:159:42: error: implicit declaration of func=
tion 'topology_drawer_id'; did you mean 'topology_die_id'? [-Werror=3Dimpli=
cit-function-declaration]
     seq_printf(m, "drawer id       : %d\n", topology_drawer_id(n));
                                             ^~~~~~~~~~~~~~~~~~
                                             topology_die_id
   cc1: some warnings being treated as errors

vim +158 arch/s390/kernel/processor.c

   153	=

   154	static void show_cpu_topo(struct seq_file *m, unsigned long n)
   155	{
   156		seq_printf(m, "physical id     : %d\n", topology_physical_package_i=
d(n));
   157		seq_printf(m, "core id         : %d\n", topology_core_id(n));
 > 158		seq_printf(m, "book id         : %d\n", topology_book_id(n));
 > 159		seq_printf(m, "drawer id       : %d\n", topology_drawer_id(n));
   160		seq_printf(m, "dedicated       : %d\n", topology_cpu_dedicated(n));
   161	}
   162	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3146542423047672369==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3146542423047672369==--

