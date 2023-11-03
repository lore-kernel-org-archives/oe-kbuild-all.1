Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C1D249EB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 22:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5Qb4n/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699051738; x=1730587738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fJTYHcP93aadpeGJfPvKxAiggUPNAVj1GEkIAJ2bSBs=;
  b=d5Qb4n/ICZEMy6/DvRdlOfgiG5673+ema7CG3cqkFpLqsogh42TmTOy+
   r3tOEWXBzzWUD5diJgUDV+haGmfL37tBBZhq8wPY4fplYm7sH/s5HcAvI
   4CjGa3Nq813Coc6icYbqJHhxTHAcWhOH96p6JTfcF2buTSLZxZieHrVt6
   v5YejHzWAHRR0yrzMcdm075EuIxv5cLGSXLVpK0VJprA4eXgNerHSRiK8
   1O0v6C7PPPrgOP1bl1iSDy9sCqfId4ufVAMBwx+IBqySpuflqqqAis4wf
   T9umHdnLoNdDunDqZmMdu8cMXnMqwqnIvPLzn7o8cUPzzXtGbxklJ5QGL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="374068881"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="374068881"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 15:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="832159598"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="832159598"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Nov 2023 15:48:55 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz2yE-00031U-1v;
	Fri, 03 Nov 2023 22:48:54 +0000
Date: Sat, 4 Nov 2023 06:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1] fs/fuse/backing.c:1218:
 undefined reference to `fuse_get_bpf_prog'
Message-ID: <202311040615.Chq1wJpp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   88b56693e9ccd5d2f7975a862279518a1d971561
commit: 9bc75534b343be508a9a492afc9699caa807da26 [1/1] ANDROID: fuse-bpf v1.1
config: i386-randconfig-061-20231104 (https://download.01.org/0day-ci/archive/20231104/202311040615.Chq1wJpp-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040615.Chq1wJpp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040615.Chq1wJpp-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/fuse/backing.o: in function `fuse_handle_bpf_prog':
>> fs/fuse/backing.c:1218: undefined reference to `fuse_get_bpf_prog'
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   drivers/media/common/videobuf2/videobuf2-core.c:2070: undefined reference to `v4l_vb2q_enable_media_source'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]
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

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/backing.c:138:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c:294:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c:1256:24: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c: note: in included file (through include/linux/compat.h, include/linux/filter.h, fs/fuse/fuse_i.h):
   include/linux/fs.h:3506:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   include/linux/fs.h:3506:20: sparse:     expected restricted __kernel_rwf_t
   include/linux/fs.h:3506:20: sparse:     got int
   include/linux/fs.h:3506:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   include/linux/fs.h:3506:20: sparse:     expected restricted __kernel_rwf_t
   include/linux/fs.h:3506:20: sparse:     got int
   fs/fuse/backing.c:2041:18: sparse: sparse: Initializer entry defined twice
   fs/fuse/backing.c:2042:18: sparse:   also defined here

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
