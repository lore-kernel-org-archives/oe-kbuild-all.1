Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D4F42DA3D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 13:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354380; cv=none; b=SD2T3epmhwPQ3NroJW2l/CBOsdJRELk4MF21Ncg07YfDMJpPu3sqSxwhqLRzs8hUl1TnRrHGKm8XsZSwYIh+qbGVoeuC3xnz2x6dBbwZGzsdb8f/RgK9sjJErBjLwNjisKlMPGqQzZm1Q8Zz1n3VsDmHUbqgnvZ7/D3Z1YQ+c2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354380; c=relaxed/simple;
	bh=s1qv/ItgQFbZNcylvQ8Y041xRAGswh3LON2LTJeuDv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GTn/Tf0AgDlY/DlhIYOl5UjjZulM2abdYq4GxjXtU7laa01NiLYRvcC8k9ttjHxRo9UkirVr+VSIBwDMDjUJD3BBAYs/VTOzm2GpcqJTMSz7gkMuLvNhZxXUsbtrG0u0H9fd14LV7V2tdmGWsBhTdL9yeAk37l23L7D4udzJlQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCt7h4py; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCt7h4py"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788354379; x=1819890379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s1qv/ItgQFbZNcylvQ8Y041xRAGswh3LON2LTJeuDv0=;
  b=nCt7h4pynPiLCLK8vO7riwj6cxytzGyOCi4xbTasDfx2QE+iqPqxzSwD
   zKiT8eAhoeN7NztU7nQ+dBpht3sDOU1/YP4Hcnf41mFB1051otBq6ST/X
   M/AX/2EPHSjxu91WFYenS9vcKir/rWVBOJ5fKdvBgS4NQ6G8as68OjVZI
   YONhUqDiIfsPRVZccyPVfk3O83tGYdLesR3Ahn4PV5zxmtIex2a78CNpl
   b88H5upSQ1EoF6y8ceRd9DesJFfuwl/EE5YidUopRmtsmw4K9kd9xySbJ
   Eojithx8uWGW2lFGz9ncz/1QKxXBIyzXyyjBnHds2FM5eTY8Ra5SNaRqV
   g==;
X-CSE-ConnectionGUID: sSW4W+T5SSq2qzGgCI5USQ==
X-CSE-MsgGUID: E/RZSUxLRFy954HFKYQZqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88687353"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="88687353"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 06:06:18 -0700
X-CSE-ConnectionGUID: ifW7lftaQy6HGyFARj+AIQ==
X-CSE-MsgGUID: XQJEHRUDSLucO3I+DggEpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="268098507"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2026 06:06:16 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1kfO-000000002jI-3KyP;
	Wed, 02 Sep 2026 13:06:14 +0000
Date: Wed, 02 Sep 2026 21:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:wk-3way-merge 74/180]
 kernel/module/decompress.c:112:31: error: too many arguments to function
 'scratchpad_alloc'; expected 2, have 3
Message-ID: <202609022117.XejGzHJ4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git wk-3way-merge
head:   d0c943103cb664ad87f6e3202f62d82153394afe
commit: 150c4ac3f72211323b916d80201583b5074abd4c [74/180] module: Route decompression workspaces and page tracking to scratchpad
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260902/202609022117.XejGzHJ4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609022117.XejGzHJ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609022117.XejGzHJ4-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/module/decompress.c: In function 'module_gzip_decompress':
>> kernel/module/decompress.c:112:31: error: too many arguments to function 'scratchpad_alloc'; expected 2, have 3
     112 |                 s.workspace = scratchpad_alloc(&info->sp, zlib_inflate_workspacesize(), GFP_KERNEL);
         |                               ^~~~~~~~~~~~~~~~
   In file included from kernel/module/internal.h:16,
                    from kernel/module/decompress.c:15:
   include/linux/scratchpad.h:169:30: note: declared here
     169 | static __always_inline void *scratchpad_alloc(struct scratchpad *sp,
         |                              ^~~~~~~~~~~~~~~~


vim +/scratchpad_alloc +112 kernel/module/decompress.c

    92	
    93	static ssize_t module_gzip_decompress(struct load_info *info,
    94					      const void *buf, size_t size)
    95	{
    96		struct z_stream_s s = { 0 };
    97		size_t new_size = 0;
    98		size_t gzip_hdr_len;
    99		ssize_t retval;
   100		int rc;
   101	
   102		gzip_hdr_len = module_gzip_header_len(buf, size);
   103		if (!gzip_hdr_len) {
   104			pr_err("not a gzip compressed module\n");
   105			return -EINVAL;
   106		}
   107	
   108		s.next_in = buf + gzip_hdr_len;
   109		s.avail_in = size - gzip_hdr_len;
   110	
   111		if (static_branch_likely(&modload_ENABLE_KEY))
 > 112			s.workspace = scratchpad_alloc(&info->sp, zlib_inflate_workspacesize(), GFP_KERNEL);
   113		else
   114			s.workspace = kvmalloc(zlib_inflate_workspacesize(), GFP_KERNEL);
   115		if (!s.workspace)
   116			return -ENOMEM;
   117	
   118		rc = zlib_inflateInit2(&s, -MAX_WBITS);
   119		if (rc != Z_OK) {
   120			pr_err("failed to initialize decompressor: %d\n", rc);
   121			retval = -EINVAL;
   122			goto out;
   123		}
   124	
   125		do {
   126			struct page *page = module_get_next_page(info);
   127	
   128			if (IS_ERR(page)) {
   129				retval = PTR_ERR(page);
   130				goto out_inflate_end;
   131			}
   132	
   133			s.next_out = kmap_local_page(page);
   134			s.avail_out = PAGE_SIZE;
   135			rc = zlib_inflate(&s, 0);
   136			kunmap_local(s.next_out);
   137	
   138			new_size += PAGE_SIZE - s.avail_out;
   139		} while (rc == Z_OK);
   140	
   141		if (rc != Z_STREAM_END) {
   142			pr_err("decompression failed with status %d\n", rc);
   143			retval = -EINVAL;
   144			goto out_inflate_end;
   145		}
   146	
   147		retval = new_size;
   148	
   149	out_inflate_end:
   150		zlib_inflateEnd(&s);
   151	out:
   152		if (!static_branch_likely(&modload_ENABLE_KEY))
   153			kvfree(s.workspace);
   154		return retval;
   155	}
   156	#elif defined(CONFIG_MODULE_COMPRESS_XZ)
   157	#include <linux/xz.h>
   158	#define MODULE_COMPRESSION	xz
   159	#define MODULE_DECOMPRESS_FN	module_xz_decompress
   160	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
