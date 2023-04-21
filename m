Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D985728E3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 18:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682102542; x=1713638542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GjXxlViwaGs5QbPPijrGmi8hDJMNBU3PzUeq0gVeC/w=;
  b=GUONjYqlQJ3exEladxqnnCg8BdpxYTs9Cta1/kQKI7+4Oe0CxxEKTEUl
   HaAKX48PJYK1dw+mv8G6EhPc+ClqX9T06OCSI0bM5nIGCsHQk1OHol/bi
   osanxQlJUtZBsc0EivNAr/7UOo51krdwxKmrBezIzJgmfveqPoK9ZI6Kx
   hQ0jeixLBm8/Xn3rWczF4omr0blrrnu4s3VoyYyKJ9ywTzazXD3f/iX57
   8VFvNLN5RTOh6h7hBX/Lk6A+QLRv3hiER7/1Ux3QSf+eiD+0oU1ZwlJKV
   xT/50f/7t44Oy9xU6o9XjnLThRwokpIZXTmyf0MwCFRj9yGesTLemVYyj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="348849955"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="348849955"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 11:42:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="1022003935"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="1022003935"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2023 11:42:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppvi7-000gjk-2V;
	Fri, 21 Apr 2023 18:42:19 +0000
Date: Sat, 22 Apr 2023 02:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Beichler <benjamin.beichler@uni-rostock.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2] average: rewrite for clearity
Message-ID: <202304220245.ctq7CKFg-lkp@intel.com>
References: <20230421134604.211128-1-benjamin.beichler@uni-rostock.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421134604.211128-1-benjamin.beichler@uni-rostock.de>

Hi Benjamin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.3-rc7 next-20230420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Beichler/average-rewrite-for-clearity/20230421-214746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230421134604.211128-1-benjamin.beichler%40uni-rostock.de
patch subject: [RFC v2] average: rewrite for clearity
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230422/202304220245.ctq7CKFg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f61e21185a0ffa11e3d84ed0b6159882a921347e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Beichler/average-rewrite-for-clearity/20230421-214746
        git checkout f61e21185a0ffa11e3d84ed0b6159882a921347e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/net/wireless/realtek/rtw88/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220245.ctq7CKFg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/realtek/rtw88/main.h:11,
                    from drivers/net/wireless/realtek/rtw88/main.c:7:
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_tp_init_val':
>> include/linux/average.h:45:17: error: expected ';' before 'e'
      45 |                 e->internal = init << _precision;                               \
         |                 ^
   drivers/net/wireless/realtek/rtw88/main.h:647:1: note: in expansion of macro 'DECLARE_EWMA'
     647 | DECLARE_EWMA(tp, 10, 2);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_tp_read':
>> include/linux/average.h:55:17: error: expected ';' before 'return'
      55 |                 return e->internal >> (_precision);                             \
         |                 ^~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:647:1: note: in expansion of macro 'DECLARE_EWMA'
     647 | DECLARE_EWMA(tp, 10, 2);
         | ^~~~~~~~~~~~
   In file included from ./arch/sh/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:247,
                    from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/devcoredump.h:8,
                    from drivers/net/wireless/realtek/rtw88/main.c:5:
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_tp_add':
>> include/asm-generic/rwonce.h:59:1: error: expected ';' before 'do'
      59 | do {                                                                    \
         | ^~
   include/linux/average.h:66:17: note: in expansion of macro 'WRITE_ONCE'
      66 |                 WRITE_ONCE(e->internal,                                         \
         |                 ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:647:1: note: in expansion of macro 'DECLARE_EWMA'
     647 | DECLARE_EWMA(tp, 10, 2);
         | ^~~~~~~~~~~~
   include/linux/average.h:62:31: warning: unused variable 'precision' [-Wunused-variable]
      62 |                 unsigned long precision = _precision;                           \
         |                               ^~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:647:1: note: in expansion of macro 'DECLARE_EWMA'
     647 | DECLARE_EWMA(tp, 10, 2);
         | ^~~~~~~~~~~~
   include/linux/average.h:61:31: warning: unused variable 'weight_rcp' [-Wunused-variable]
      61 |                 unsigned long weight_rcp = ilog2(_weight_rcp);                  \
         |                               ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:647:1: note: in expansion of macro 'DECLARE_EWMA'
     647 | DECLARE_EWMA(tp, 10, 2);
         | ^~~~~~~~~~~~
   include/linux/average.h:60:31: warning: unused variable 'internal' [-Wunused-variable]
      60 |                 unsigned long internal = READ_ONCE(e->internal);                \
         |                               ^~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:647:1: note: in expansion of macro 'DECLARE_EWMA'
     647 | DECLARE_EWMA(tp, 10, 2);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_tp_add_or_init':
>> include/asm-generic/rwonce.h:59:1: error: expected ';' before 'do'
      59 | do {                                                                    \
         | ^~
   include/linux/average.h:79:17: note: in expansion of macro 'WRITE_ONCE'
      79 |                 WRITE_ONCE(e->internal, internal ?                              \
         |                 ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:647:1: note: in expansion of macro 'DECLARE_EWMA'
     647 | DECLARE_EWMA(tp, 10, 2);
         | ^~~~~~~~~~~~
   include/linux/average.h:75:31: warning: unused variable 'precision' [-Wunused-variable]
      75 |                 unsigned long precision = _precision;                           \
         |                               ^~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:647:1: note: in expansion of macro 'DECLARE_EWMA'
     647 | DECLARE_EWMA(tp, 10, 2);
         | ^~~~~~~~~~~~
   include/linux/average.h:74:31: warning: unused variable 'weight_rcp' [-Wunused-variable]
      74 |                 unsigned long weight_rcp = ilog2(_weight_rcp);                  \
         |                               ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:647:1: note: in expansion of macro 'DECLARE_EWMA'
     647 | DECLARE_EWMA(tp, 10, 2);
         | ^~~~~~~~~~~~
   include/linux/average.h:73:31: warning: unused variable 'internal' [-Wunused-variable]
      73 |                 unsigned long internal = READ_ONCE(e->internal);                \
         |                               ^~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:647:1: note: in expansion of macro 'DECLARE_EWMA'
     647 | DECLARE_EWMA(tp, 10, 2);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_rssi_init_val':
>> include/linux/average.h:45:17: error: expected ';' before 'e'
      45 |                 e->internal = init << _precision;                               \
         |                 ^
   drivers/net/wireless/realtek/rtw88/main.h:743:1: note: in expansion of macro 'DECLARE_EWMA'
     743 | DECLARE_EWMA(rssi, 10, 16);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_rssi_read':
>> include/linux/average.h:55:17: error: expected ';' before 'return'
      55 |                 return e->internal >> (_precision);                             \
         |                 ^~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:743:1: note: in expansion of macro 'DECLARE_EWMA'
     743 | DECLARE_EWMA(rssi, 10, 16);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_rssi_add':
>> include/asm-generic/rwonce.h:59:1: error: expected ';' before 'do'
      59 | do {                                                                    \
         | ^~
   include/linux/average.h:66:17: note: in expansion of macro 'WRITE_ONCE'
      66 |                 WRITE_ONCE(e->internal,                                         \
         |                 ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:743:1: note: in expansion of macro 'DECLARE_EWMA'
     743 | DECLARE_EWMA(rssi, 10, 16);
         | ^~~~~~~~~~~~
   include/linux/average.h:62:31: warning: unused variable 'precision' [-Wunused-variable]
      62 |                 unsigned long precision = _precision;                           \
         |                               ^~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:743:1: note: in expansion of macro 'DECLARE_EWMA'
     743 | DECLARE_EWMA(rssi, 10, 16);
         | ^~~~~~~~~~~~
   include/linux/average.h:61:31: warning: unused variable 'weight_rcp' [-Wunused-variable]
      61 |                 unsigned long weight_rcp = ilog2(_weight_rcp);                  \
         |                               ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:743:1: note: in expansion of macro 'DECLARE_EWMA'
     743 | DECLARE_EWMA(rssi, 10, 16);
         | ^~~~~~~~~~~~
   include/linux/average.h:60:31: warning: unused variable 'internal' [-Wunused-variable]
      60 |                 unsigned long internal = READ_ONCE(e->internal);                \
         |                               ^~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:743:1: note: in expansion of macro 'DECLARE_EWMA'
     743 | DECLARE_EWMA(rssi, 10, 16);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_rssi_add_or_init':
>> include/asm-generic/rwonce.h:59:1: error: expected ';' before 'do'
      59 | do {                                                                    \
         | ^~
   include/linux/average.h:79:17: note: in expansion of macro 'WRITE_ONCE'
      79 |                 WRITE_ONCE(e->internal, internal ?                              \
         |                 ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:743:1: note: in expansion of macro 'DECLARE_EWMA'
     743 | DECLARE_EWMA(rssi, 10, 16);
         | ^~~~~~~~~~~~
   include/linux/average.h:75:31: warning: unused variable 'precision' [-Wunused-variable]
      75 |                 unsigned long precision = _precision;                           \
         |                               ^~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:743:1: note: in expansion of macro 'DECLARE_EWMA'
     743 | DECLARE_EWMA(rssi, 10, 16);
         | ^~~~~~~~~~~~
   include/linux/average.h:74:31: warning: unused variable 'weight_rcp' [-Wunused-variable]
      74 |                 unsigned long weight_rcp = ilog2(_weight_rcp);                  \
         |                               ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:743:1: note: in expansion of macro 'DECLARE_EWMA'
     743 | DECLARE_EWMA(rssi, 10, 16);
         | ^~~~~~~~~~~~
   include/linux/average.h:73:31: warning: unused variable 'internal' [-Wunused-variable]
      73 |                 unsigned long internal = READ_ONCE(e->internal);                \
         |                               ^~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:743:1: note: in expansion of macro 'DECLARE_EWMA'
     743 | DECLARE_EWMA(rssi, 10, 16);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_thermal_init_val':
>> include/linux/average.h:45:17: error: expected ';' before 'e'
      45 |                 e->internal = init << _precision;                               \
         |                 ^
   drivers/net/wireless/realtek/rtw88/main.h:1548:1: note: in expansion of macro 'DECLARE_EWMA'
    1548 | DECLARE_EWMA(thermal, 10, 4);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_thermal_read':
>> include/linux/average.h:55:17: error: expected ';' before 'return'
      55 |                 return e->internal >> (_precision);                             \
         |                 ^~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1548:1: note: in expansion of macro 'DECLARE_EWMA'
    1548 | DECLARE_EWMA(thermal, 10, 4);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_thermal_add':
>> include/asm-generic/rwonce.h:59:1: error: expected ';' before 'do'
      59 | do {                                                                    \
         | ^~
   include/linux/average.h:66:17: note: in expansion of macro 'WRITE_ONCE'
      66 |                 WRITE_ONCE(e->internal,                                         \
         |                 ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1548:1: note: in expansion of macro 'DECLARE_EWMA'
    1548 | DECLARE_EWMA(thermal, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:62:31: warning: unused variable 'precision' [-Wunused-variable]
      62 |                 unsigned long precision = _precision;                           \
         |                               ^~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1548:1: note: in expansion of macro 'DECLARE_EWMA'
    1548 | DECLARE_EWMA(thermal, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:61:31: warning: unused variable 'weight_rcp' [-Wunused-variable]
      61 |                 unsigned long weight_rcp = ilog2(_weight_rcp);                  \
         |                               ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1548:1: note: in expansion of macro 'DECLARE_EWMA'
    1548 | DECLARE_EWMA(thermal, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:60:31: warning: unused variable 'internal' [-Wunused-variable]
      60 |                 unsigned long internal = READ_ONCE(e->internal);                \
         |                               ^~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1548:1: note: in expansion of macro 'DECLARE_EWMA'
    1548 | DECLARE_EWMA(thermal, 10, 4);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_thermal_add_or_init':
>> include/asm-generic/rwonce.h:59:1: error: expected ';' before 'do'
      59 | do {                                                                    \
         | ^~
   include/linux/average.h:79:17: note: in expansion of macro 'WRITE_ONCE'
      79 |                 WRITE_ONCE(e->internal, internal ?                              \
         |                 ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1548:1: note: in expansion of macro 'DECLARE_EWMA'
    1548 | DECLARE_EWMA(thermal, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:75:31: warning: unused variable 'precision' [-Wunused-variable]
      75 |                 unsigned long precision = _precision;                           \
         |                               ^~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1548:1: note: in expansion of macro 'DECLARE_EWMA'
    1548 | DECLARE_EWMA(thermal, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:74:31: warning: unused variable 'weight_rcp' [-Wunused-variable]
      74 |                 unsigned long weight_rcp = ilog2(_weight_rcp);                  \
         |                               ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1548:1: note: in expansion of macro 'DECLARE_EWMA'
    1548 | DECLARE_EWMA(thermal, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:73:31: warning: unused variable 'internal' [-Wunused-variable]
      73 |                 unsigned long internal = READ_ONCE(e->internal);                \
         |                               ^~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1548:1: note: in expansion of macro 'DECLARE_EWMA'
    1548 | DECLARE_EWMA(thermal, 10, 4);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_evm_init_val':
>> include/linux/average.h:45:17: error: expected ';' before 'e'
      45 |                 e->internal = init << _precision;                               \
         |                 ^
   drivers/net/wireless/realtek/rtw88/main.h:1594:1: note: in expansion of macro 'DECLARE_EWMA'
    1594 | DECLARE_EWMA(evm, 10, 4);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_evm_read':
>> include/linux/average.h:55:17: error: expected ';' before 'return'
      55 |                 return e->internal >> (_precision);                             \
         |                 ^~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1594:1: note: in expansion of macro 'DECLARE_EWMA'
    1594 | DECLARE_EWMA(evm, 10, 4);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_evm_add':
>> include/asm-generic/rwonce.h:59:1: error: expected ';' before 'do'
      59 | do {                                                                    \
         | ^~
   include/linux/average.h:66:17: note: in expansion of macro 'WRITE_ONCE'
      66 |                 WRITE_ONCE(e->internal,                                         \
         |                 ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1594:1: note: in expansion of macro 'DECLARE_EWMA'
    1594 | DECLARE_EWMA(evm, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:62:31: warning: unused variable 'precision' [-Wunused-variable]
      62 |                 unsigned long precision = _precision;                           \
         |                               ^~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1594:1: note: in expansion of macro 'DECLARE_EWMA'
    1594 | DECLARE_EWMA(evm, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:61:31: warning: unused variable 'weight_rcp' [-Wunused-variable]
      61 |                 unsigned long weight_rcp = ilog2(_weight_rcp);                  \
         |                               ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1594:1: note: in expansion of macro 'DECLARE_EWMA'
    1594 | DECLARE_EWMA(evm, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:60:31: warning: unused variable 'internal' [-Wunused-variable]
      60 |                 unsigned long internal = READ_ONCE(e->internal);                \
         |                               ^~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1594:1: note: in expansion of macro 'DECLARE_EWMA'
    1594 | DECLARE_EWMA(evm, 10, 4);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_evm_add_or_init':
>> include/asm-generic/rwonce.h:59:1: error: expected ';' before 'do'
      59 | do {                                                                    \
         | ^~
   include/linux/average.h:79:17: note: in expansion of macro 'WRITE_ONCE'
      79 |                 WRITE_ONCE(e->internal, internal ?                              \
         |                 ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1594:1: note: in expansion of macro 'DECLARE_EWMA'
    1594 | DECLARE_EWMA(evm, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:75:31: warning: unused variable 'precision' [-Wunused-variable]
      75 |                 unsigned long precision = _precision;                           \
         |                               ^~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1594:1: note: in expansion of macro 'DECLARE_EWMA'
    1594 | DECLARE_EWMA(evm, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:74:31: warning: unused variable 'weight_rcp' [-Wunused-variable]
      74 |                 unsigned long weight_rcp = ilog2(_weight_rcp);                  \
         |                               ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1594:1: note: in expansion of macro 'DECLARE_EWMA'
    1594 | DECLARE_EWMA(evm, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:73:31: warning: unused variable 'internal' [-Wunused-variable]
      73 |                 unsigned long internal = READ_ONCE(e->internal);                \
         |                               ^~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1594:1: note: in expansion of macro 'DECLARE_EWMA'
    1594 | DECLARE_EWMA(evm, 10, 4);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_snr_init_val':
>> include/linux/average.h:45:17: error: expected ';' before 'e'
      45 |                 e->internal = init << _precision;                               \
         |                 ^
   drivers/net/wireless/realtek/rtw88/main.h:1595:1: note: in expansion of macro 'DECLARE_EWMA'
    1595 | DECLARE_EWMA(snr, 10, 4);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_snr_read':
>> include/linux/average.h:55:17: error: expected ';' before 'return'
      55 |                 return e->internal >> (_precision);                             \
         |                 ^~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1595:1: note: in expansion of macro 'DECLARE_EWMA'
    1595 | DECLARE_EWMA(snr, 10, 4);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_snr_add':
>> include/asm-generic/rwonce.h:59:1: error: expected ';' before 'do'
      59 | do {                                                                    \
         | ^~
   include/linux/average.h:66:17: note: in expansion of macro 'WRITE_ONCE'
      66 |                 WRITE_ONCE(e->internal,                                         \
         |                 ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1595:1: note: in expansion of macro 'DECLARE_EWMA'
    1595 | DECLARE_EWMA(snr, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:62:31: warning: unused variable 'precision' [-Wunused-variable]
      62 |                 unsigned long precision = _precision;                           \
         |                               ^~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1595:1: note: in expansion of macro 'DECLARE_EWMA'
    1595 | DECLARE_EWMA(snr, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:61:31: warning: unused variable 'weight_rcp' [-Wunused-variable]
      61 |                 unsigned long weight_rcp = ilog2(_weight_rcp);                  \
         |                               ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1595:1: note: in expansion of macro 'DECLARE_EWMA'
    1595 | DECLARE_EWMA(snr, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:60:31: warning: unused variable 'internal' [-Wunused-variable]
      60 |                 unsigned long internal = READ_ONCE(e->internal);                \
         |                               ^~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1595:1: note: in expansion of macro 'DECLARE_EWMA'
    1595 | DECLARE_EWMA(snr, 10, 4);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_snr_add_or_init':
>> include/asm-generic/rwonce.h:59:1: error: expected ';' before 'do'
      59 | do {                                                                    \
         | ^~
   include/linux/average.h:79:17: note: in expansion of macro 'WRITE_ONCE'
      79 |                 WRITE_ONCE(e->internal, internal ?                              \
         |                 ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1595:1: note: in expansion of macro 'DECLARE_EWMA'
    1595 | DECLARE_EWMA(snr, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:75:31: warning: unused variable 'precision' [-Wunused-variable]
      75 |                 unsigned long precision = _precision;                           \
         |                               ^~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1595:1: note: in expansion of macro 'DECLARE_EWMA'
    1595 | DECLARE_EWMA(snr, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:74:31: warning: unused variable 'weight_rcp' [-Wunused-variable]
      74 |                 unsigned long weight_rcp = ilog2(_weight_rcp);                  \
         |                               ^~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1595:1: note: in expansion of macro 'DECLARE_EWMA'
    1595 | DECLARE_EWMA(snr, 10, 4);
         | ^~~~~~~~~~~~
   include/linux/average.h:73:31: warning: unused variable 'internal' [-Wunused-variable]
      73 |                 unsigned long internal = READ_ONCE(e->internal);                \
         |                               ^~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h:1595:1: note: in expansion of macro 'DECLARE_EWMA'
    1595 | DECLARE_EWMA(snr, 10, 4);
         | ^~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/main.h: In function 'ewma_tp_read':
   include/linux/average.h:56:9: error: control reaches end of non-void function [-Werror=return-type]
      56 |         }                                                                       \
         |         ^
   drivers/net/wireless/realtek/rtw88/main.h:647:1: note: in expansion of macro 'DECLARE_EWMA'
     647 | DECLARE_EWMA(tp, 10, 2);
         | ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
..


vim +45 include/linux/average.h

     8	
     9	/*
    10	 * Exponentially weighted moving average (EWMA)
    11	 *
    12	 * This implements a fixed-precision EWMA algorithm, with both the
    13	 * precision and fall-off coefficient determined at compile-time
    14	 * and built into the generated helper funtions.
    15	 *
    16	 * The first argument to the macro is the name that will be used
    17	 * for the struct and helper functions.
    18	 *
    19	 * The second argument, the precision, expresses how many bits are
    20	 * used for the fractional part of the fixed-precision values.
    21	 *
    22	 * The third argument, the weight reciprocal, determines how the
    23	 * new values will be weighed vs. the old state, new values will
    24	 * get weight 1/weight_rcp and old values 1-1/weight_rcp. Note
    25	 * that this parameter must be a power of two for efficiency.
    26	 */
    27	
    28	#define EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
    29		do {								\
    30			BUILD_BUG_ON(!__builtin_constant_p(_precision));	\
    31			BUILD_BUG_ON(!__builtin_constant_p(_weight_rcp));	\
    32										\
    33			BUILD_BUG_ON((_precision) > 30);			\
    34			BUILD_BUG_ON_NOT_POWER_OF_2(_weight_rcp);		\
    35		} while (0)
    36	
    37	#define DECLARE_EWMA(name, _precision, _weight_rcp)				\
    38		struct ewma_##name {							\
    39			unsigned long internal;						\
    40		};									\
    41		static inline void ewma_##name##_init_val(struct ewma_##name *e,	\
    42							  unsigned long init)		\
    43		{									\
    44			EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
  > 45			e->internal = init << _precision;				\
    46		}									\
    47		static inline void ewma_##name##_init(struct ewma_##name *e)		\
    48		{									\
    49				ewma_##name##_init_val(e, 0);				\
    50		}									\
    51		static inline unsigned long						\
    52		ewma_##name##_read(struct ewma_##name *e)				\
    53		{									\
    54			EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
  > 55			return e->internal >> (_precision);				\
    56		}									\
    57		static inline void ewma_##name##_add(struct ewma_##name *e,		\
    58						     unsigned long val)			\
    59		{									\
    60			unsigned long internal = READ_ONCE(e->internal);		\
    61			unsigned long weight_rcp = ilog2(_weight_rcp);			\
    62			unsigned long precision = _precision;				\
    63											\
    64			EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
    65											\
    66			WRITE_ONCE(e->internal,						\
    67				(((internal << weight_rcp) - internal) +		\
    68					(val << precision)) >> weight_rcp);		\
    69		}									\
    70		static inline void ewma_##name##_add_or_init(struct ewma_##name *e,	\
    71						     unsigned long val)			\
    72		{									\
    73			unsigned long internal = READ_ONCE(e->internal);		\
    74			unsigned long weight_rcp = ilog2(_weight_rcp);			\
    75			unsigned long precision = _precision;				\
    76											\
    77			EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
    78											\
    79			WRITE_ONCE(e->internal, internal ?				\
    80				(((internal << weight_rcp) - internal) +		\
    81					(val << precision)) >> weight_rcp :		\
    82				(val << precision));					\
    83		}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
