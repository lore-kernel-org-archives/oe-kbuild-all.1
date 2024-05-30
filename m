Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9890717E44B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 21:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717105053; cv=none; b=TNi3zE0n0jH7o4OviAJi9FITiNhQXm5qZQelFp/Yocv+GmUjEmf8+NsMuWxPUBLmMTEN9uD1M23e6opO/Vt8xgDHhvUpmiZYvMpYcvL/IdoMJ4f2SLt88YK0wo9LNNbhY52Ry9ANGx7dEeRmOfEyXB+Y2bBQTrYFUogC78fx8C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717105053; c=relaxed/simple;
	bh=XsFw7Mt1tz/SrOvoRWYGSq/sn2X882GikK6K1pky3Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rgTZzoPK1R5pqG0iqnTsha7eno24xFnN+n5N97pAuMeKfcsIbjDKb+WdclmXJ/1llbkl5GOB/PBfZCSN6AvNlBu+rCuTmgfc4ryOSMTMWVN6XuJLV+RhwPz3Hd1VByE8Iszfw/r5FalP8KvCQg/IK2lU08MWfllIAzp3QhTzFCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cgvyz7/O; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cgvyz7/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717105052; x=1748641052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XsFw7Mt1tz/SrOvoRWYGSq/sn2X882GikK6K1pky3Vg=;
  b=Cgvyz7/OUkhKb9j87BTw7La6CzyIph+xQlftvI7z3fK1KemFr57gvOvT
   wbibbqLtZEP8s6n/yl5DG1LA9aJ7j9iJT1EyYvSWfZMvqpTgJ1ymHisuE
   rdD4EG1SXN0U3jNOIeUZUu3OqC8JxnQpSYtRW0SKJkQZWkFn2GpFKW92h
   C4oPGO7N1KQamTQDnxYQjov9jZzCyHC3rFAuHcGSR8r8JnLNN5VEZndvX
   6aM1IvmpgSbptlraLq1jaZRcwcn+X6zPE1CFhYuFpprBlBF1eihu45eYo
   cMDsHixNT0oWtJi9aIJVMygMFz0R8ZknMbEo8187Z0zN/pajmerdvn/Cp
   A==;
X-CSE-ConnectionGUID: Zax6DHEPSxWRgkb3LZxXbw==
X-CSE-MsgGUID: PrfSnglMQMW72ilafmKfYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24290357"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="24290357"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 14:33:49 -0700
X-CSE-ConnectionGUID: nEr4ZfqiT/+X6V6ikO6cPA==
X-CSE-MsgGUID: IeSNDkA7TDWm2ouAOyBj3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="35944667"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 May 2024 14:33:47 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCnP7-000G0l-1k;
	Thu, 30 May 2024 21:33:45 +0000
Date: Fri, 31 May 2024 05:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/3] fs/fuse/backing.c:1218:undefined
 reference to `fuse_get_bpf_prog'
Message-ID: <202405310502.LwiMndTe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   7ea5014410f786539cbdc8efa564732410677818
commit: f5f4199c102aa676998b42abff60d071385c1c0c [1/3] ANDROID: fuse-bpf v1.1
config: x86_64-randconfig-013-20240531 (https://download.01.org/0day-ci/archive/20240531/202405310502.LwiMndTe-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405310502.LwiMndTe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405310502.LwiMndTe-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/fuse/backing.o: in function `fuse_handle_bpf_prog':
>> fs/fuse/backing.c:1218:(.text+0xaa8e): undefined reference to `fuse_get_bpf_prog'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +1218 fs/fuse/backing.c

  1186	
  1187	int fuse_handle_bpf_prog(struct fuse_entry_bpf *feb, struct inode *parent,
  1188				 struct bpf_prog **bpf)
  1189	{
  1190		struct fuse_inode *pi;
  1191	
  1192		// Parent isn't presented, but we want to keep
  1193		// Don't touch bpf program at all in this case
  1194		if (feb->out.bpf_action == FUSE_ACTION_KEEP && !parent)
  1195			goto out;
  1196	
  1197		if (*bpf) {
  1198			bpf_prog_put(*bpf);
  1199			*bpf = NULL;
  1200		}
  1201	
  1202		switch (feb->out.bpf_action) {
  1203		case FUSE_ACTION_KEEP:
  1204			pi = get_fuse_inode(parent);
  1205			*bpf = pi->bpf;
  1206			if (*bpf)
  1207				bpf_prog_inc(*bpf);
  1208			break;
  1209	
  1210		case FUSE_ACTION_REMOVE:
  1211			break;
  1212	
  1213		case FUSE_ACTION_REPLACE: {
  1214			struct file *bpf_file = feb->bpf_file;
  1215			struct bpf_prog *bpf_prog = ERR_PTR(-EINVAL);
  1216	
  1217			if (bpf_file && !IS_ERR(bpf_file))
> 1218				bpf_prog = fuse_get_bpf_prog(bpf_file);
  1219	
  1220			if (IS_ERR(bpf_prog))
  1221				return PTR_ERR(bpf_prog);
  1222	
  1223			*bpf = bpf_prog;
  1224			break;
  1225		}
  1226	
  1227		default:
  1228			return -EINVAL;
  1229		}
  1230	
  1231	out:
  1232		return 0;
  1233	}
  1234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
