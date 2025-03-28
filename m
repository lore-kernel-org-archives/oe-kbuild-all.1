Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EBC14A82
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 02:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743130561; cv=none; b=QV6E5meYy7RNa9X9I8mU72HGKrPTyD23+VTomndj5f4ArplF3EHRQmZrVckUFC9FWh5qxaD39wN1Kn94SpnpjhlqoBmnxAzIehWHB60c8XSrJE9PvQ5ZPpSkyzyyO9olGT0rub21SCwY/TJit6ala0SUmY4nXjAeJEneSTxDJXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743130561; c=relaxed/simple;
	bh=Nt5//uNKqWiJfMlQuhGTDK9WAXChAYxBTZ75fHRR64E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aQoygtv8WEDXBFO4Bz038ODqOVgOgFSxIvjSJSVhIVRW9WqJ6ePZ0Lage8Pw6kg9yGeLu2cjAUTsi6/9gwMEX/1BCrRCMAxS58jw2treTcE6ad9BbXQVW01xcIoHiW4X6LD7WtnfqZ6fw44+qvYAxokbz6684+NiAY87//l+A0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXelI+yT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXelI+yT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743130559; x=1774666559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nt5//uNKqWiJfMlQuhGTDK9WAXChAYxBTZ75fHRR64E=;
  b=eXelI+yTIw4GTPa69v+hfGLmSDXoQ41pDtPEtPuVzA/LY7bzWryQnfuU
   JrHXkx7UwPqtAC7c8GivgRvprPjp/5YT4a6mnjvbCvEkeChiDI9Ty+x+I
   dx/xOE+zwiMSsfMciGUYMh69yk6qXrFz7+zimoKOoOKCWw3I1aBvj1DQC
   /j3KoYZvL4zsfv9vdHimoDnOuDO4DABJgDglZEcAa6RD7VcdXLeQu5px9
   ffC6uW/PwsHUJbgpidxaeQB+c91xD30Cgr60tpJEkLVBM1skV+JXidBW4
   9uOsFynPizxjB51uE9EG22ewbVJHvYJYEUZdj7+8ydSShR4rsh8RRX8Na
   w==;
X-CSE-ConnectionGUID: 2PM5L6ErQt2AmLIUqKlEoQ==
X-CSE-MsgGUID: TVYtAoqhScixq+4SSIvDVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55134563"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="55134563"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 19:55:59 -0700
X-CSE-ConnectionGUID: 7OXbKuTWSWupl+uNnFPujw==
X-CSE-MsgGUID: 23V9rfMiQleQ68dE9ITMQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="125129434"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 27 Mar 2025 19:55:58 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txzsx-00076I-2G;
	Fri, 28 Mar 2025 02:55:55 +0000
Date: Fri, 28 Mar 2025 10:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-10 2/2]
 fs/xfs/./scrub/trace.h:748:3: warning: 'strncpy' specified bound 256 equals
 destination size
Message-ID: <202503281042.d4I2zSiI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Darrick,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-10
head:   da759a1462b23348c55a6399190d67bd1d1051b9
commit: 3934e8ebb7cc6e5f1ade35d586ed3eb79b88eb95 [2/2] xfs: create a big array data structure
config: arm-randconfig-004-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281042.d4I2zSiI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281042.d4I2zSiI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503281042.d4I2zSiI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from fs/xfs/scrub/trace.h:1119,
                    from fs/xfs/scrub/trace.c:42:
   fs/xfs/./scrub/trace.h: In function 'trace_event_raw_event_xfile_create':
>> fs/xfs/./scrub/trace.h:748:3: warning: 'strncpy' specified bound 256 equals destination size [-Wstringop-truncation]
      strncpy(__entry->pathname, path, sizeof(__entry->pathname));
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:402:4: note: in definition of macro 'DECLARE_EVENT_CLASS'
     { assign; }       \
       ^~~~~~
   include/trace/trace_events.h:44:9: note: in expansion of macro 'PARAMS'
            PARAMS(assign),         \
            ^~~~~~
   fs/xfs/./scrub/trace.h:731:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(xfile_create,
    ^~~~~~~~~~~
   fs/xfs/./scrub/trace.h:739:2: note: in expansion of macro 'TP_fast_assign'
     TP_fast_assign(
     ^~~~~~~~~~~~~~


vim +/strncpy +748 fs/xfs/./scrub/trace.h

   730	
   731	TRACE_EVENT(xfile_create,
   732		TP_PROTO(struct xfile *xf),
   733		TP_ARGS(xf),
   734		TP_STRUCT__entry(
   735			__field(dev_t, dev)
   736			__field(unsigned long, ino)
   737			__array(char, pathname, 256)
   738		),
   739		TP_fast_assign(
   740			char		pathname[257];
   741			char		*path;
   742	
   743			__entry->ino = file_inode(xf->file)->i_ino;
   744			memset(pathname, 0, sizeof(pathname));
   745			path = file_path(xf->file, pathname, sizeof(pathname) - 1);
   746			if (IS_ERR(path))
   747				path = "(unknown)";
 > 748			strncpy(__entry->pathname, path, sizeof(__entry->pathname));
   749		),
   750		TP_printk("xfino 0x%lx path '%s'",
   751			  __entry->ino,
   752			  __entry->pathname)
   753	);
   754	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
