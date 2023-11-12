Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5394C14F6A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmvOrXn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699805984; x=1731341984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HSNJYnU8ECEXTH9TrDMEeRk3xJv+I1430HTcSJHweks=;
  b=nmvOrXn1K4Tnl1BbIJP1R3DhQKp8gamfzfxglEKbkeozDIrpGQuyrPBx
   O/xHjhQ+5o+e43iqI6B/DhkhRcpfxruIRYbIX5m4axMQ7otWtL17AZzmW
   UlDh1ucMA34mZhbrspaS25GIfxjWiU+ZBXPzqt92PV/aZ09epoOoE4x+Y
   bwk53iH96VAHSHLjNlcHGicL7CBD0ydIGCtWzviEaCT8uPBikVbUT9BmG
   8dffXZh2y9RgHkVNN83s5QZz5zNGOO5U8DIMxobHITsnE65rzbL0Hu3SY
   mJRMoNFfgTpevKpIDm4gAzQOeTJFNX8076koCTNgai/oKGVq/iU+k8oOY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="369666317"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="369666317"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 08:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="764148794"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="764148794"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Nov 2023 08:19:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2DBT-000BHo-26;
	Sun, 12 Nov 2023 16:19:39 +0000
Date: Mon, 13 Nov 2023 00:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Seth Forshee (DigitalOcean)" <sforshee@kernel.org>
Subject: fs/namespace.c:3039: warning: Function parameter or member 'mp' not
 described in 'can_move_mount_beneath'
Message-ID: <202311130023.1vEX34Us-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b907d0507354b74a4f2c286380cd6059af79248
commit: 6ac392815628f317fcfdca1a39df00b9cc4ebc8b fs: allow to mount beneath top mount
date:   6 months ago
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20231113/202311130023.1vEX34Us-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311130023.1vEX34Us-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311130023.1vEX34Us-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/namespace.c:3039: warning: Function parameter or member 'mp' not described in 'can_move_mount_beneath'


vim +3039 fs/namespace.c

  3015	
  3016	/**
  3017	 * can_move_mount_beneath - check that we can mount beneath the top mount
  3018	 * @from: mount to mount beneath
  3019	 * @to:   mount under which to mount
  3020	 *
  3021	 * - Make sure that @to->dentry is actually the root of a mount under
  3022	 *   which we can mount another mount.
  3023	 * - Make sure that nothing can be mounted beneath the caller's current
  3024	 *   root or the rootfs of the namespace.
  3025	 * - Make sure that the caller can unmount the topmost mount ensuring
  3026	 *   that the caller could reveal the underlying mountpoint.
  3027	 * - Ensure that nothing has been mounted on top of @from before we
  3028	 *   grabbed @namespace_sem to avoid creating pointless shadow mounts.
  3029	 * - Prevent mounting beneath a mount if the propagation relationship
  3030	 *   between the source mount, parent mount, and top mount would lead to
  3031	 *   nonsensical mount trees.
  3032	 *
  3033	 * Context: This function expects namespace_lock() to be held.
  3034	 * Return: On success 0, and on error a negative error code is returned.
  3035	 */
  3036	static int can_move_mount_beneath(const struct path *from,
  3037					  const struct path *to,
  3038					  const struct mountpoint *mp)
> 3039	{
  3040		struct mount *mnt_from = real_mount(from->mnt),
  3041			     *mnt_to = real_mount(to->mnt),
  3042			     *parent_mnt_to = mnt_to->mnt_parent;
  3043	
  3044		if (!mnt_has_parent(mnt_to))
  3045			return -EINVAL;
  3046	
  3047		if (!path_mounted(to))
  3048			return -EINVAL;
  3049	
  3050		if (IS_MNT_LOCKED(mnt_to))
  3051			return -EINVAL;
  3052	
  3053		/* Avoid creating shadow mounts during mount propagation. */
  3054		if (path_overmounted(from))
  3055			return -EINVAL;
  3056	
  3057		/*
  3058		 * Mounting beneath the rootfs only makes sense when the
  3059		 * semantics of pivot_root(".", ".") are used.
  3060		 */
  3061		if (&mnt_to->mnt == current->fs->root.mnt)
  3062			return -EINVAL;
  3063		if (parent_mnt_to == current->nsproxy->mnt_ns->root)
  3064			return -EINVAL;
  3065	
  3066		for (struct mount *p = mnt_from; mnt_has_parent(p); p = p->mnt_parent)
  3067			if (p == mnt_to)
  3068				return -EINVAL;
  3069	
  3070		/*
  3071		 * If the parent mount propagates to the child mount this would
  3072		 * mean mounting @mnt_from on @mnt_to->mnt_parent and then
  3073		 * propagating a copy @c of @mnt_from on top of @mnt_to. This
  3074		 * defeats the whole purpose of mounting beneath another mount.
  3075		 */
  3076		if (propagation_would_overmount(parent_mnt_to, mnt_to, mp))
  3077			return -EINVAL;
  3078	
  3079		/*
  3080		 * If @mnt_to->mnt_parent propagates to @mnt_from this would
  3081		 * mean propagating a copy @c of @mnt_from on top of @mnt_from.
  3082		 * Afterwards @mnt_from would be mounted on top of
  3083		 * @mnt_to->mnt_parent and @mnt_to would be unmounted from
  3084		 * @mnt->mnt_parent and remounted on @mnt_from. But since @c is
  3085		 * already mounted on @mnt_from, @mnt_to would ultimately be
  3086		 * remounted on top of @c. Afterwards, @mnt_from would be
  3087		 * covered by a copy @c of @mnt_from and @c would be covered by
  3088		 * @mnt_from itself. This defeats the whole purpose of mounting
  3089		 * @mnt_from beneath @mnt_to.
  3090		 */
  3091		if (propagation_would_overmount(parent_mnt_to, mnt_from, mp))
  3092			return -EINVAL;
  3093	
  3094		return 0;
  3095	}
  3096	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
