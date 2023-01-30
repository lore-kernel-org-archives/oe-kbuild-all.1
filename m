Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591783C13
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 15:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675094289; x=1706630289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V5TlcdQiTVQuKqv37IS4HDmcXVCJY+auKk6lSFEhJEw=;
  b=LIjbpOpPRaTaeniue0hV9tD1tgyvqg0/peEjEeUfdbEB1w3aRe60T6FC
   gDvsN4NUrAUSOaCTEJ2PDCLJsEkgCNoSHmFi/+JDJbslK9v1cIakEOz6l
   BNK0kDEyK0dsfHwHsokxIVTuJFzPYaAoD7wsXS82B9iodFhI4PQhP3/TZ
   unaMbbregrJ1Zs5h3uryZDhVwnb5D+wCbxF7FNL7oZg2e8ghO8faK+D00
   3iDHV0qD3L72Dmfn59aE5RIiWGAvOZIDfhj+7DTSPh0E+h3VN65GWoK88
   xKZbB1TqQsiLXtXzP6CLCm4laikSGws5DIQHzBTGvdhQv5HmucMDZXwXr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="392137377"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="392137377"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 07:58:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="909551154"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="909551154"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 Jan 2023 07:58:07 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMWXm-0003ic-2k;
	Mon, 30 Jan 2023 15:58:06 +0000
Date: Mon, 30 Jan 2023 23:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:file_build_id 1/4] include/linux/buildid.h:31: multiple
 definition of `build_id_init'; fs/isofs/namei.o:include/linux/buildid.h:31:
 first defined here
Message-ID: <202301302307.6rxyizoj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git file_build_id
head:   19769e82685efd26d7714d6f12601da7e48086e8
commit: 39dec2be008ec7c98f7ea818bc2c0f15a3586ef2 [1/4] mm: Store build id in file object
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230130/202301302307.6rxyizoj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=39dec2be008ec7c98f7ea818bc2c0f15a3586ef2
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf file_build_id
        git checkout 39dec2be008ec7c98f7ea818bc2c0f15a3586ef2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: fs/isofs/inode.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/isofs/namei.o:include/linux/buildid.h:31: first defined here
   ld: fs/isofs/inode.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/isofs/namei.o:include/linux/buildid.h:32: first defined here
   ld: fs/isofs/dir.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/isofs/namei.o:include/linux/buildid.h:31: first defined here
   ld: fs/isofs/dir.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/isofs/namei.o:include/linux/buildid.h:32: first defined here
   ld: fs/isofs/util.o: in function `build_id_init':
   fs/isofs/util.c:31: multiple definition of `build_id_init'; fs/isofs/namei.o:include/linux/buildid.h:31: first defined here
   ld: fs/isofs/util.o: in function `build_id_free':
   fs/isofs/util.c:32: multiple definition of `build_id_free'; fs/isofs/namei.o:include/linux/buildid.h:32: first defined here
   ld: fs/isofs/rock.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/isofs/namei.o:include/linux/buildid.h:31: first defined here
   ld: fs/isofs/rock.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/isofs/namei.o:include/linux/buildid.h:32: first defined here
   ld: fs/isofs/export.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/isofs/namei.o:include/linux/buildid.h:31: first defined here
   ld: fs/isofs/export.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/isofs/namei.o:include/linux/buildid.h:32: first defined here
   ld: fs/isofs/joliet.o: in function `build_id_init':
   fs/isofs/joliet.c:31: multiple definition of `build_id_init'; fs/isofs/namei.o:include/linux/buildid.h:31: first defined here
   ld: fs/isofs/joliet.o: in function `build_id_free':
   fs/isofs/joliet.c:32: multiple definition of `build_id_free'; fs/isofs/namei.o:include/linux/buildid.h:32: first defined here
--
   ld: block/bfq-wf2q.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; block/bfq-iosched.o:include/linux/buildid.h:31: first defined here
   ld: block/bfq-wf2q.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; block/bfq-iosched.o:include/linux/buildid.h:32: first defined here
   ld: block/bfq-cgroup.o: in function `build_id_init':
   block/bfq-cgroup.c:31: multiple definition of `build_id_init'; block/bfq-iosched.o:include/linux/buildid.h:31: first defined here
   ld: block/bfq-cgroup.o: in function `build_id_free':
   block/bfq-cgroup.c:32: multiple definition of `build_id_free'; block/bfq-iosched.o:include/linux/buildid.h:32: first defined here


vim +31 include/linux/buildid.h

    25	
    26	#ifdef CONFIG_FILE_BUILD_ID
    27	void __init build_id_init(void);
    28	void build_id_free(struct build_id *bid);
    29	int vma_get_build_id(struct vm_area_struct *vma, struct build_id **bidp);
    30	#else
  > 31	void __init build_id_init(void) { }
  > 32	void build_id_free(struct build_id *bid) { }
    33	#endif /* CONFIG_FILE_BUILD_ID */
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
