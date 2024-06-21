Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BBB15444C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 12:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973967; cv=none; b=dK/9K2DqXdbfnVWWWdWjsof5qMYZ8avA+ln8y+H3LeRx39CX1R3F7giFmmsTJS/eQgB72LoTIy+F0Jg8dG44IECH20td3Cj1Fko1NpkTOsfEGjNXCkC88X/7KNcNe+SOHevy5SGUB9jk9SQl6SZV0389Ojctl5L2FQ+5olElDkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973967; c=relaxed/simple;
	bh=iSJZsi/nIe4y5QD+x6OgOTVaaB4LaafLI/tB6KwB540=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hC9+yedym4WpuyOVu9P7mRgJk+P6pmI5eYXgqkVHcvV6sY8FpQmldoiiqy0uazy34VetVd+VJp6apEsp1Uuy3l4chkd22ZLwcWk+OO5VSvrwTauEBMWkfGF/L7W+W7TdlpMZAfJh24jC4KOsJnNzb0oggkO/MyYC6GJsBtKlyfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lzCUPbHN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzCUPbHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718973966; x=1750509966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iSJZsi/nIe4y5QD+x6OgOTVaaB4LaafLI/tB6KwB540=;
  b=lzCUPbHNDyeAeU+EJVudz+65qWQhn1XQ/F40eD5p4BEgHUAMJ9oTjxSq
   nURiz3O2h/JyljhHPgiDaHlBGVvDIOi31Lmai+LMKS9mL14SlZAxLlYV5
   n8AULhAmmlcTsKm/K7u72GWZxFPW+RSS1Q4B+2t8IAqBaq8swJ4nxehTK
   e2xDskdh9K93lxAD6atTHUls7Nb7t7LWRd8pPtc350CS7fVAfdE+EOqPn
   NsWNs130LmTfyYL/hPowYIr+kSR4FcSdUIBR0SGJC+PC5FzvU4UVyYbiV
   M0uLquynY/YvT7p/mh71pH7d6gmd+Orz7HjVqFubv0hi1o6jGN063SGHG
   Q==;
X-CSE-ConnectionGUID: 9rTvhywZSMSujMTpyzFiGA==
X-CSE-MsgGUID: 3NrraPVqSPaRI+VwkSf3Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15704563"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="15704563"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 05:46:05 -0700
X-CSE-ConnectionGUID: ZVXPlPTTRPS/eFhPSfw+/g==
X-CSE-MsgGUID: xxZ/h1W7RHCjkaZX7Es8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="43269710"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Jun 2024 05:46:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKdeT-0008ac-2N;
	Fri, 21 Jun 2024 12:46:01 +0000
Date: Fri, 21 Jun 2024 20:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st 1764/2327] fs/nilfs2/sufile.c:529:38: sparse:
 sparse: incorrect type in argument 3 (different base types)
Message-ID: <202406212015.sccNElZc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st
head:   409c5ed72dea954d899affc6a3470a938115ca9a
commit: 8ed962df4f2a87f0d6ec1c4690a6191a189032e6 [1764/2327] nilfs2: prevent WARNING in nilfs_sufile_set_segment_usage()
config: i386-randconfig-r122-20240621 (https://download.01.org/0day-ci/archive/20240621/202406212015.sccNElZc-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406212015.sccNElZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406212015.sccNElZc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nilfs2/sufile.c:529:38: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected char const * @@     got unsigned long long @@
   fs/nilfs2/sufile.c:529:38: sparse:     expected char const *
   fs/nilfs2/sufile.c:529:38: sparse:     got unsigned long long
>> fs/nilfs2/sufile.c:529:57: sparse: sparse: non size-preserving integer to pointer cast
   In file included from include/linux/buffer_head.h:13:0,
                    from fs/nilfs2/sufile.c:27:
   include/linux/pagemap.h: In function 'fault_in_multipages_readable':
   include/linux/pagemap.h:632:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
     volatile char c;
                   ^
   fs/nilfs2/sufile.c: In function 'nilfs_sufile_mark_dirty':
   fs/nilfs2/sufile.c:529:9: warning: passing argument 3 of 'nilfs_error' makes pointer from integer without a cast [-Wint-conversion]
            (unsigned long long)segnum);
            ^
   In file included from fs/nilfs2/mdt.h:28:0,
                    from fs/nilfs2/sufile.c:30:
   fs/nilfs2/nilfs.h:303:6: note: expected 'const char *' but argument is of type 'long long unsigned int'
    void nilfs_error(struct super_block *, const char *, const char *, ...);
         ^~~~~~~~~~~

vim +529 fs/nilfs2/sufile.c

   501	
   502	/**
   503	 * nilfs_sufile_mark_dirty - mark the buffer having a segment usage dirty
   504	 * @sufile: inode of segment usage file
   505	 * @segnum: segment number
   506	 */
   507	int nilfs_sufile_mark_dirty(struct inode *sufile, __u64 segnum)
   508	{
   509		struct buffer_head *bh;
   510		void *kaddr;
   511		struct nilfs_segment_usage *su;
   512		int ret;
   513	
   514		down_write(&NILFS_MDT(sufile)->mi_sem);
   515		ret = nilfs_sufile_get_segment_usage_block(sufile, segnum, 0, &bh);
   516		if (ret)
   517			goto out_sem;
   518	
   519		kaddr = kmap_atomic(bh->b_page);
   520		su = nilfs_sufile_block_get_segment_usage(sufile, segnum, bh, kaddr);
   521		if (unlikely(nilfs_segment_usage_error(su))) {
   522			struct the_nilfs *nilfs = sufile->i_sb->s_fs_info;
   523	
   524			kunmap_atomic(kaddr);
   525			brelse(bh);
   526			if (nilfs_segment_is_active(nilfs, segnum)) {
   527				nilfs_error(sufile->i_sb,
   528					    "active segment %llu is erroneous",
 > 529					    (unsigned long long)segnum);
   530			} else {
   531				/*
   532				 * Segments marked erroneous are never allocated by
   533				 * nilfs_sufile_alloc(); only active segments, ie,
   534				 * the segments indexed by ns_segnum or ns_nextnum,
   535				 * can be erroneous here.
   536				 */
   537				WARN_ON_ONCE(1);
   538			}
   539			ret = -EIO;
   540		} else {
   541			nilfs_segment_usage_set_dirty(su);
   542			kunmap_atomic(kaddr);
   543			mark_buffer_dirty(bh);
   544			nilfs_mdt_mark_dirty(sufile);
   545			brelse(bh);
   546		}
   547	out_sem:
   548		up_write(&NILFS_MDT(sufile)->mi_sem);
   549		return ret;
   550	}
   551	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
