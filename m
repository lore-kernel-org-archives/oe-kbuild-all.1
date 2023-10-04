Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0AA224FC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 20:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4JGycoS"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696451217; x=1727987217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jPAI2xz1VJ0HaBstNYOgkKVfzEiUE58MOcQpt/qKLK0=;
  b=U4JGycoSDb3AqwIF6Vh715cTB51zJF/dRAsyoDlWHcUZ30rey8npg0PD
   bZd/hAkKNcdVX9zqfIUtf2yEPTBNaXhVUA/6q0UClGBR4GNl+r4OXV5NJ
   WfTzyuKAxETTdqNpIemQf7yuZhPmBZ8ex6a20VD9iEn5BASgY/9NY/mvW
   Rt63aiaLhaCDXCVIjpQcJG7BhneRaM0O1TWSNi+e6wRsbEcpOOlht1HL/
   AiBdWXqOwQWEFCSnAxnMw2S4p6ykM9zsyvwGWtsPw8ngrcV25/zF2h/Iz
   01nJN7yhtGgzizbuTaBZKPTGBOpt3zIspYtbehqzhQx5SeFd37YHCKQ41
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="447479207"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="447479207"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 13:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="842050536"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="842050536"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Oct 2023 13:26:48 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo8SE-000Kaw-0y;
	Wed, 04 Oct 2023 20:26:46 +0000
Date: Thu, 5 Oct 2023 04:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:atomics/outlined 1/2]
 include/linux/atomic/atomic-outlined.h:15:1: warning: no previous
 declaration for 'outlined_raw_atomic_read'
Message-ID: <202310050419.u57zMM3J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git atomics/outlined
head:   263c0a69d189a2d4b3c79cb731c51443c5e077e5
commit: e0a77bfa63e7416d610769aa4ab62bc06993ce56 [1/2] HACK: add outlined atomics
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20231005/202310050419.u57zMM3J-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050419.u57zMM3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050419.u57zMM3J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/atomic_outlined.c:6:0:
>> include/linux/atomic/atomic-outlined.h:15:1: warning: no previous declaration for 'outlined_raw_atomic_read' [-Wmissing-declarations]
    outlined_raw_atomic_read(const atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:21:1: warning: no previous declaration for 'outlined_raw_atomic_read_acquire' [-Wmissing-declarations]
    outlined_raw_atomic_read_acquire(const atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:27:1: warning: no previous declaration for 'outlined_atomic_read' [-Wmissing-declarations]
    outlined_atomic_read(const atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:33:1: warning: no previous declaration for 'outlined_atomic_read_acquire' [-Wmissing-declarations]
    outlined_atomic_read_acquire(const atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:39:1: warning: no previous declaration for 'outlined_raw_atomic_set' [-Wmissing-declarations]
    outlined_raw_atomic_set(atomic_t *v, int i)
    ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:45:1: warning: no previous declaration for 'outlined_raw_atomic_set_release' [-Wmissing-declarations]
    outlined_raw_atomic_set_release(atomic_t *v, int i)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:51:1: warning: no previous declaration for 'outlined_atomic_set' [-Wmissing-declarations]
    outlined_atomic_set(atomic_t *v, int i)
    ^~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:57:1: warning: no previous declaration for 'outlined_atomic_set_release' [-Wmissing-declarations]
    outlined_atomic_set_release(atomic_t *v, int i)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:63:1: warning: no previous declaration for 'outlined_raw_atomic_add' [-Wmissing-declarations]
    outlined_raw_atomic_add(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:69:1: warning: no previous declaration for 'outlined_raw_atomic_add_return' [-Wmissing-declarations]
    outlined_raw_atomic_add_return(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:75:1: warning: no previous declaration for 'outlined_raw_atomic_add_return_acquire' [-Wmissing-declarations]
    outlined_raw_atomic_add_return_acquire(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:81:1: warning: no previous declaration for 'outlined_raw_atomic_add_return_release' [-Wmissing-declarations]
    outlined_raw_atomic_add_return_release(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:87:1: warning: no previous declaration for 'outlined_raw_atomic_add_return_relaxed' [-Wmissing-declarations]
    outlined_raw_atomic_add_return_relaxed(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:93:1: warning: no previous declaration for 'outlined_raw_atomic_fetch_add' [-Wmissing-declarations]
    outlined_raw_atomic_fetch_add(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:99:1: warning: no previous declaration for 'outlined_raw_atomic_fetch_add_acquire' [-Wmissing-declarations]
    outlined_raw_atomic_fetch_add_acquire(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:105:1: warning: no previous declaration for 'outlined_raw_atomic_fetch_add_release' [-Wmissing-declarations]
    outlined_raw_atomic_fetch_add_release(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:111:1: warning: no previous declaration for 'outlined_raw_atomic_fetch_add_relaxed' [-Wmissing-declarations]
    outlined_raw_atomic_fetch_add_relaxed(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:117:1: warning: no previous declaration for 'outlined_atomic_add' [-Wmissing-declarations]
    outlined_atomic_add(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:123:1: warning: no previous declaration for 'outlined_atomic_add_return' [-Wmissing-declarations]
    outlined_atomic_add_return(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/atomic/atomic-outlined.h:129:1: warning: no previous declaration for 'outlined_atomic_add_return_acquire' [-Wmissing-declarations]
    outlined_atomic_add_return_acquire(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:135:1: warning: no previous declaration for 'outlined_atomic_add_return_release' [-Wmissing-declarations]
    outlined_atomic_add_return_release(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:141:1: warning: no previous declaration for 'outlined_atomic_add_return_relaxed' [-Wmissing-declarations]
    outlined_atomic_add_return_relaxed(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:147:1: warning: no previous declaration for 'outlined_atomic_fetch_add' [-Wmissing-declarations]
    outlined_atomic_fetch_add(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:153:1: warning: no previous declaration for 'outlined_atomic_fetch_add_acquire' [-Wmissing-declarations]
    outlined_atomic_fetch_add_acquire(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:159:1: warning: no previous declaration for 'outlined_atomic_fetch_add_release' [-Wmissing-declarations]
    outlined_atomic_fetch_add_release(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:165:1: warning: no previous declaration for 'outlined_atomic_fetch_add_relaxed' [-Wmissing-declarations]
    outlined_atomic_fetch_add_relaxed(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:171:1: warning: no previous declaration for 'outlined_raw_atomic_sub' [-Wmissing-declarations]
    outlined_raw_atomic_sub(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:177:1: warning: no previous declaration for 'outlined_raw_atomic_sub_return' [-Wmissing-declarations]
    outlined_raw_atomic_sub_return(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:183:1: warning: no previous declaration for 'outlined_raw_atomic_sub_return_acquire' [-Wmissing-declarations]
    outlined_raw_atomic_sub_return_acquire(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:189:1: warning: no previous declaration for 'outlined_raw_atomic_sub_return_release' [-Wmissing-declarations]
    outlined_raw_atomic_sub_return_release(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:195:1: warning: no previous declaration for 'outlined_raw_atomic_sub_return_relaxed' [-Wmissing-declarations]
    outlined_raw_atomic_sub_return_relaxed(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:201:1: warning: no previous declaration for 'outlined_raw_atomic_fetch_sub' [-Wmissing-declarations]
    outlined_raw_atomic_fetch_sub(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:207:1: warning: no previous declaration for 'outlined_raw_atomic_fetch_sub_acquire' [-Wmissing-declarations]
    outlined_raw_atomic_fetch_sub_acquire(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:213:1: warning: no previous declaration for 'outlined_raw_atomic_fetch_sub_release' [-Wmissing-declarations]
    outlined_raw_atomic_fetch_sub_release(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:219:1: warning: no previous declaration for 'outlined_raw_atomic_fetch_sub_relaxed' [-Wmissing-declarations]
    outlined_raw_atomic_fetch_sub_relaxed(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:225:1: warning: no previous declaration for 'outlined_atomic_sub' [-Wmissing-declarations]
    outlined_atomic_sub(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:231:1: warning: no previous declaration for 'outlined_atomic_sub_return' [-Wmissing-declarations]
    outlined_atomic_sub_return(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:237:1: warning: no previous declaration for 'outlined_atomic_sub_return_acquire' [-Wmissing-declarations]
    outlined_atomic_sub_return_acquire(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:243:1: warning: no previous declaration for 'outlined_atomic_sub_return_release' [-Wmissing-declarations]
    outlined_atomic_sub_return_release(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:249:1: warning: no previous declaration for 'outlined_atomic_sub_return_relaxed' [-Wmissing-declarations]
    outlined_atomic_sub_return_relaxed(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:255:1: warning: no previous declaration for 'outlined_atomic_fetch_sub' [-Wmissing-declarations]
    outlined_atomic_fetch_sub(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:261:1: warning: no previous declaration for 'outlined_atomic_fetch_sub_acquire' [-Wmissing-declarations]
    outlined_atomic_fetch_sub_acquire(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:267:1: warning: no previous declaration for 'outlined_atomic_fetch_sub_release' [-Wmissing-declarations]
    outlined_atomic_fetch_sub_release(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:273:1: warning: no previous declaration for 'outlined_atomic_fetch_sub_relaxed' [-Wmissing-declarations]
    outlined_atomic_fetch_sub_relaxed(int i, atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:279:1: warning: no previous declaration for 'outlined_raw_atomic_inc' [-Wmissing-declarations]
    outlined_raw_atomic_inc(atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:285:1: warning: no previous declaration for 'outlined_raw_atomic_inc_return' [-Wmissing-declarations]
    outlined_raw_atomic_inc_return(atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:291:1: warning: no previous declaration for 'outlined_raw_atomic_inc_return_acquire' [-Wmissing-declarations]
    outlined_raw_atomic_inc_return_acquire(atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:297:1: warning: no previous declaration for 'outlined_raw_atomic_inc_return_release' [-Wmissing-declarations]
    outlined_raw_atomic_inc_return_release(atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:303:1: warning: no previous declaration for 'outlined_raw_atomic_inc_return_relaxed' [-Wmissing-declarations]
    outlined_raw_atomic_inc_return_relaxed(atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:309:1: warning: no previous declaration for 'outlined_raw_atomic_fetch_inc' [-Wmissing-declarations]
    outlined_raw_atomic_fetch_inc(atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:315:1: warning: no previous declaration for 'outlined_raw_atomic_fetch_inc_acquire' [-Wmissing-declarations]
    outlined_raw_atomic_fetch_inc_acquire(atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:321:1: warning: no previous declaration for 'outlined_raw_atomic_fetch_inc_release' [-Wmissing-declarations]
    outlined_raw_atomic_fetch_inc_release(atomic_t *v)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-outlined.h:327:1: warning: no previous declaration for 'outlined_raw_atomic_fetch_inc_relaxed' [-Wmissing-declarations]
    outlined_raw_atomic_fetch_inc_relaxed(atomic_t *v)


vim +/outlined_raw_atomic_read +15 include/linux/atomic/atomic-outlined.h

    13	
    14	noinline noinstr int
  > 15	outlined_raw_atomic_read(const atomic_t *v)
    16	{
    17		return raw_atomic_read(v);
    18	}
    19	
    20	noinline noinstr int
  > 21	outlined_raw_atomic_read_acquire(const atomic_t *v)
    22	{
    23		return raw_atomic_read_acquire(v);
    24	}
    25	
    26	noinline int
  > 27	outlined_atomic_read(const atomic_t *v)
    28	{
    29		return atomic_read(v);
    30	}
    31	
    32	noinline int
  > 33	outlined_atomic_read_acquire(const atomic_t *v)
    34	{
    35		return atomic_read_acquire(v);
    36	}
    37	
    38	noinline noinstr void
  > 39	outlined_raw_atomic_set(atomic_t *v, int i)
    40	{
    41		raw_atomic_set(v, i);
    42	}
    43	
    44	noinline noinstr void
  > 45	outlined_raw_atomic_set_release(atomic_t *v, int i)
    46	{
    47		raw_atomic_set_release(v, i);
    48	}
    49	
    50	noinline void
  > 51	outlined_atomic_set(atomic_t *v, int i)
    52	{
    53		atomic_set(v, i);
    54	}
    55	
    56	noinline void
  > 57	outlined_atomic_set_release(atomic_t *v, int i)
    58	{
    59		atomic_set_release(v, i);
    60	}
    61	
    62	noinline noinstr void
  > 63	outlined_raw_atomic_add(int i, atomic_t *v)
    64	{
    65		raw_atomic_add(i, v);
    66	}
    67	
    68	noinline noinstr int
  > 69	outlined_raw_atomic_add_return(int i, atomic_t *v)
    70	{
    71		return raw_atomic_add_return(i, v);
    72	}
    73	
    74	noinline noinstr int
  > 75	outlined_raw_atomic_add_return_acquire(int i, atomic_t *v)
    76	{
    77		return raw_atomic_add_return_acquire(i, v);
    78	}
    79	
    80	noinline noinstr int
  > 81	outlined_raw_atomic_add_return_release(int i, atomic_t *v)
    82	{
    83		return raw_atomic_add_return_release(i, v);
    84	}
    85	
    86	noinline noinstr int
  > 87	outlined_raw_atomic_add_return_relaxed(int i, atomic_t *v)
    88	{
    89		return raw_atomic_add_return_relaxed(i, v);
    90	}
    91	
    92	noinline noinstr int
  > 93	outlined_raw_atomic_fetch_add(int i, atomic_t *v)
    94	{
    95		return raw_atomic_fetch_add(i, v);
    96	}
    97	
    98	noinline noinstr int
  > 99	outlined_raw_atomic_fetch_add_acquire(int i, atomic_t *v)
   100	{
   101		return raw_atomic_fetch_add_acquire(i, v);
   102	}
   103	
   104	noinline noinstr int
 > 105	outlined_raw_atomic_fetch_add_release(int i, atomic_t *v)
   106	{
   107		return raw_atomic_fetch_add_release(i, v);
   108	}
   109	
   110	noinline noinstr int
 > 111	outlined_raw_atomic_fetch_add_relaxed(int i, atomic_t *v)
   112	{
   113		return raw_atomic_fetch_add_relaxed(i, v);
   114	}
   115	
   116	noinline void
 > 117	outlined_atomic_add(int i, atomic_t *v)
   118	{
   119		atomic_add(i, v);
   120	}
   121	
   122	noinline int
 > 123	outlined_atomic_add_return(int i, atomic_t *v)
   124	{
   125		return atomic_add_return(i, v);
   126	}
   127	
   128	noinline int
 > 129	outlined_atomic_add_return_acquire(int i, atomic_t *v)
   130	{
   131		return atomic_add_return_acquire(i, v);
   132	}
   133	
   134	noinline int
 > 135	outlined_atomic_add_return_release(int i, atomic_t *v)
   136	{
   137		return atomic_add_return_release(i, v);
   138	}
   139	
   140	noinline int
 > 141	outlined_atomic_add_return_relaxed(int i, atomic_t *v)
   142	{
   143		return atomic_add_return_relaxed(i, v);
   144	}
   145	
   146	noinline int
 > 147	outlined_atomic_fetch_add(int i, atomic_t *v)
   148	{
   149		return atomic_fetch_add(i, v);
   150	}
   151	
   152	noinline int
 > 153	outlined_atomic_fetch_add_acquire(int i, atomic_t *v)
   154	{
   155		return atomic_fetch_add_acquire(i, v);
   156	}
   157	
   158	noinline int
 > 159	outlined_atomic_fetch_add_release(int i, atomic_t *v)
   160	{
   161		return atomic_fetch_add_release(i, v);
   162	}
   163	
   164	noinline int
 > 165	outlined_atomic_fetch_add_relaxed(int i, atomic_t *v)
   166	{
   167		return atomic_fetch_add_relaxed(i, v);
   168	}
   169	
   170	noinline noinstr void
 > 171	outlined_raw_atomic_sub(int i, atomic_t *v)
   172	{
   173		raw_atomic_sub(i, v);
   174	}
   175	
   176	noinline noinstr int
 > 177	outlined_raw_atomic_sub_return(int i, atomic_t *v)
   178	{
   179		return raw_atomic_sub_return(i, v);
   180	}
   181	
   182	noinline noinstr int
 > 183	outlined_raw_atomic_sub_return_acquire(int i, atomic_t *v)
   184	{
   185		return raw_atomic_sub_return_acquire(i, v);
   186	}
   187	
   188	noinline noinstr int
 > 189	outlined_raw_atomic_sub_return_release(int i, atomic_t *v)
   190	{
   191		return raw_atomic_sub_return_release(i, v);
   192	}
   193	
   194	noinline noinstr int
 > 195	outlined_raw_atomic_sub_return_relaxed(int i, atomic_t *v)
   196	{
   197		return raw_atomic_sub_return_relaxed(i, v);
   198	}
   199	
   200	noinline noinstr int
 > 201	outlined_raw_atomic_fetch_sub(int i, atomic_t *v)
   202	{
   203		return raw_atomic_fetch_sub(i, v);
   204	}
   205	
   206	noinline noinstr int
 > 207	outlined_raw_atomic_fetch_sub_acquire(int i, atomic_t *v)
   208	{
   209		return raw_atomic_fetch_sub_acquire(i, v);
   210	}
   211	
   212	noinline noinstr int
 > 213	outlined_raw_atomic_fetch_sub_release(int i, atomic_t *v)
   214	{
   215		return raw_atomic_fetch_sub_release(i, v);
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
