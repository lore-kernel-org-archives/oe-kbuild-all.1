Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209711CF5C6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 21:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754257343; cv=none; b=pEh3oLFEWgU+vl4EQ3W0P/Vhi8ZYEZgJtYwDiEQN+ZNg0rK1XAtiF4IfYY6Evv3JkKAgauMDkrlV5HlDIKnycumxZr3alsNqjCSuMSyfyY9rZVN/RKv2C0qWOPyYST29qILfFy+ys1UDv8RdzE4J6sr1F587evJrmlqisMnN0ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754257343; c=relaxed/simple;
	bh=6SNn1HqM0/uUcViELJyoNLnHJn1Xdah5+zRkvZNDiTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p0ioOVlgSnNFf3A6cc13iHtkr9IR6tRsc3iqs/QaG4m/A+MTWNqRGwTf5u8S8RAGfcHUJfAD/HkmpHcz0+8hMuA0cqZQuxpJlCqvlSkBvDUXM0WSC4Vggx6os7cweX+MXl2VUKv/tEQ2r9Q9L/0cxscedlcDoTPbWjLLdrzTRm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vs9+sdCI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vs9+sdCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754257342; x=1785793342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6SNn1HqM0/uUcViELJyoNLnHJn1Xdah5+zRkvZNDiTU=;
  b=Vs9+sdCIGIDy3XpcaweahKZ1GVxF+l5eOhaHwRwcXY3qkmfW+5XAjK5k
   Ss0sAxfKwbxmE+QWaD9lZsqPUHTRfx9jr5UXzLlnoIzgHxz9PlIIm92IF
   ovGUCD7QM7gga+MpkY/SsXRxghl0uuiBZb/IXl1HTJBQcHI6fdlZgdCQA
   DqekP2jyaPNoQGQyl4iyl0NYx89dDWq5EhOCz/rP9YBnDp9J+tzC/YdFG
   0knYGEPkuErLlHNCpCT90IFrSZNfHvBohbMVs712hkt5Di2lfYkyml+4e
   XnOkL4/o3dWUbtHUu9bxjtK+1El6SbrX7tj+45DgWf1/ikTa/LgJIXSpL
   A==;
X-CSE-ConnectionGUID: TKG9MFbbSjy7EfNn/jy8AQ==
X-CSE-MsgGUID: M0g+2lY5Rna4FmKazh5OCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="66792607"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="66792607"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 14:42:22 -0700
X-CSE-ConnectionGUID: syX7LSqfQcadG4a8Xm1C3g==
X-CSE-MsgGUID: pDniRJeLQEi5MvMVXXNacg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169307906"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Aug 2025 14:42:20 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uigTC-0006eK-0r;
	Sun, 03 Aug 2025 21:42:18 +0000
Date: Mon, 4 Aug 2025 05:41:35 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-libcrypto 19/29] kismet: WARNING: unmet direct
 dependencies detected for RPCSEC_GSS_KRB5 when selected by NFSD_V4
Message-ID: <202508040531.UAAebVzI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-libcrypto
head:   7fbf88966943cc7f22f9dade58354f59b70be55d
commit: 65f6fc39a1e336627eb5a5d9cfa1ed3022c2d885 [19/29] nfsd: Use MD5 library instead of crypto_shash
config: alpha-kismet-CONFIG_RPCSEC_GSS_KRB5-CONFIG_NFSD_V4-0-0 (https://download.01.org/0day-ci/archive/20250804/202508040531.UAAebVzI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250804/202508040531.UAAebVzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040531.UAAebVzI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RPCSEC_GSS_KRB5 when selected by NFSD_V4
   WARNING: unmet direct dependencies detected for RPCSEC_GSS_KRB5
     Depends on [n]: NETWORK_FILESYSTEMS [=y] && SUNRPC [=y] && CRYPTO [=n]
     Selected by [y]:
     - NFSD_V4 [=y] && NETWORK_FILESYSTEMS [=y] && NFSD [=y] && PROC_FS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
