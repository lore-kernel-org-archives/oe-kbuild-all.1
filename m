Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E63156225
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717231; cv=none; b=djaGcjkb0SsCvDJyoWYmyVP42Xd+UmnjqjEcJvGnGoe47P3+b6EpQB2OjgWU+J6fGe31RQAIOaP+H243UZleXSPjJX98W07vGZUFVgfUlCVSkmd2NbrDir4doNl5M1RwZqn72J92Y8fCXJeDnq8dDC0KAYi5fsl+CQRpMtUQVOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717231; c=relaxed/simple;
	bh=VeCCLjKhwMe3TBWX5T0F3Cido5RakX4k2QP+YRN0km8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFLIvHrT4tOcijqqP27I5ctDHUTga8wC+JH7D1wZ8vwa9qK6N83IjtAk1n7x5g3aw+YiRuElIRih8O6BIVfnxXct0l1HDgAsS4+Iz1A7DkQ4gOx3at+4rJmkeF0xRyka5UXFG/YLxNt6ox8VJqRiSoq4gg01vfLJNsB+L/PyNOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bu4oK/Qw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bu4oK/Qw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717230; x=1765253230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VeCCLjKhwMe3TBWX5T0F3Cido5RakX4k2QP+YRN0km8=;
  b=Bu4oK/QwMaK1MmLeJb3cHWojNiXBz2XooeY+kC3r/rU0sPiaESSiCobZ
   HQOk+/b834NUveGvSJGjpRNmEflTz6HE0bvRDuzvsuStwXTG7joBIV6Fo
   ryhjZEHV/hl6l6hfPzuL2DwxKyqg0RrC5e3BQ2psrZV6BxhnoiojtOgTj
   LMdz9OVOyqyC8/Nn7yOTbXJN5qRCcomsnoVXDxeyk1KHxtRkjjZ7fLyY3
   7uYbxz3gZFiIlK1VY49mmAfiHoskARZb3BhGzlXGmFSk86XUIpa3ujUHK
   5Ogmmz6FFlUfPJKbnfoTRZru8UpX6IgWlT9vsqwvCjHznOasSnNih8fot
   g==;
X-CSE-ConnectionGUID: kV0AAO/dSZ+5vxGbPfEb9w==
X-CSE-MsgGUID: wWUjOCjGSaWsHjM5fzzg1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33347007"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33347007"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:07:08 -0800
X-CSE-ConnectionGUID: WFQ9HID4RUmhoCXJk7f2iw==
X-CSE-MsgGUID: XKTDHwwFSqGO3eXoXJUjEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125793753"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2024 20:07:06 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV30-0003n3-2r;
	Mon, 09 Dec 2024 04:07:02 +0000
Date: Mon, 9 Dec 2024 12:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>, linux-fsdevel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>,
	Amir Goldstein <amir73il@gmail.com>, Karel Zak <kzak@redhat.com>,
	Lennart Poettering <lennart@poettering.net>,
	Ian Kent <raven@themaw.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v2] fanotify: notify on mount attach and detach
Message-ID: <202412071154.l5pE0H0S-lkp@intel.com>
References: <20241206151154.60538-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206151154.60538-1-mszeredi@redhat.com>

Hi Miklos,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.13-rc1]
[cannot apply to jack-fs/fsnotify pcmoore-selinux/next next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miklos-Szeredi/fanotify-notify-on-mount-attach-and-detach/20241206-231407
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20241206151154.60538-1-mszeredi%40redhat.com
patch subject: [PATCH v2] fanotify: notify on mount attach and detach
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20241207/202412071154.l5pE0H0S-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071154.l5pE0H0S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071154.l5pE0H0S-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/open.c:12:
>> include/linux/fsnotify.h:258:20: error: redefinition of 'fsnotify_mntns_delete'
     258 | static inline void fsnotify_mntns_delete(struct mnt_namespace *mntns)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/fsnotify.h:15:
   include/linux/fsnotify_backend.h:914:20: note: previous definition of 'fsnotify_mntns_delete' with type 'void(struct mnt_namespace *)'
     914 | static inline void fsnotify_mntns_delete(struct mnt_namespace *mntns)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify.h: In function 'fsnotify_mntns_delete':
>> include/linux/fsnotify.h:260:9: error: implicit declaration of function '__fsnotify_mntns_delete'; did you mean 'fsnotify_mntns_delete'? [-Wimplicit-function-declaration]
     260 |         __fsnotify_mntns_delete(mntns);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         fsnotify_mntns_delete
--
   In file included from fs/namespace.c:22:
>> include/linux/fsnotify.h:258:20: error: redefinition of 'fsnotify_mntns_delete'
     258 | static inline void fsnotify_mntns_delete(struct mnt_namespace *mntns)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/fsnotify.h:15:
   include/linux/fsnotify_backend.h:914:20: note: previous definition of 'fsnotify_mntns_delete' with type 'void(struct mnt_namespace *)'
     914 | static inline void fsnotify_mntns_delete(struct mnt_namespace *mntns)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify.h: In function 'fsnotify_mntns_delete':
>> include/linux/fsnotify.h:260:9: error: implicit declaration of function '__fsnotify_mntns_delete'; did you mean 'fsnotify_mntns_delete'? [-Wimplicit-function-declaration]
     260 |         __fsnotify_mntns_delete(mntns);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         fsnotify_mntns_delete
   fs/namespace.c: In function 'queue_notify':
>> fs/namespace.c:1126:15: error: 'struct mnt_namespace' has no member named 'n_fsnotify_marks'
    1126 |         if (ns->n_fsnotify_marks)
         |               ^~


vim +/fsnotify_mntns_delete +258 include/linux/fsnotify.h

   257	
 > 258	static inline void fsnotify_mntns_delete(struct mnt_namespace *mntns)
   259	{
 > 260		__fsnotify_mntns_delete(mntns);
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
