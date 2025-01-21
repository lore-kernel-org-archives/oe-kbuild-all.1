Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962851F9F47
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 23:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737500681; cv=none; b=bS7+SCVLrqTO3VGnJXLx73xVO0kLC9mxb293kqlZ8ojsM9xOI7wFqZt9/oGty+bn8DYt3046mwkXSZHXJl12Rti8yBRKLCX/Rx11fI0l6KC9xh34r/8B3MmIvh4IqQO5HGou2tnGE7UUz98lZk+bHQ9dIZtnkwVmTroQ82D+dVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737500681; c=relaxed/simple;
	bh=eKWz7gNXdLLeb3WXTGmgEnwqM8wDNcxOkZfGf8Y3fy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ryh3IbKs0cnqCGjbMi7Mia2hLANPc/eqPoaxZav5cCUtvw7JgMPtZim5hUbJZ83TvmosegkUaN4BwJWRCEtUBg+cJKujFpNDRsuuLP1A8Fwiw7M9omrTmEAe55hxosYt8VkjJAtxwz3shcPtSzwEyT8RBfdh1imdXs9hbunMYWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5ytrDb7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5ytrDb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737500679; x=1769036679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eKWz7gNXdLLeb3WXTGmgEnwqM8wDNcxOkZfGf8Y3fy4=;
  b=K5ytrDb7V4iddJ6xhspJSkSlKY3OrT5EypuXEHtKGjtUROQsAAuHSnaN
   cZ36OCgYjMMj6FTceb5b3l2FRLns1xfXLWAktZlYnbvm6zDrH8tCS+uYf
   6MXnhap/oIukIG/XFoLsgrLzuXZSwxqoKA36VN8COIDzzE66J+Ugjv/wd
   YYT4705gGzQNgAeaK4GrfXn98ezlvvf5tgK4Pk8gJfeIE/qhAoS7qlzt6
   UCYIPyb/U4MpR1KB6PHoGPFnWegCvrlR73Kc63ZSnLxEt0a7FLbaQvZDK
   fJg3EFbx4taOuATg0OEXxibsdc94/jR8OPK3+WktkefsNzE2G9xxnsDTT
   Q==;
X-CSE-ConnectionGUID: gkpcMSMRQ2yHvrXLjhEzMQ==
X-CSE-MsgGUID: wmEebOOAStyjd+xfIYVJhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48930296"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="48930296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 15:04:39 -0800
X-CSE-ConnectionGUID: Jgv1yId6Qui0Y4QKnVMUZg==
X-CSE-MsgGUID: //6bZVXIS7CfrERVq22row==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112034477"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2025 15:04:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taNIR-000Z5r-2k;
	Tue, 21 Jan 2025 23:04:35 +0000
Date: Wed, 22 Jan 2025 07:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 fs/erofs/decompressor_lzma.c:136:29: warning: assignment to 'struct
 xz_dec_microlzma *' from 'int' makes pointer from integer without a cast
Message-ID: <202501220648.XAf2N9Ug-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   f22dfe9625b11d8041c35682344f932cbc9ca30b
commit: ede603374aab4bb8a612fd3c1c84ceef11435fa1 [1/1] FROMGIT: erofs: lzma compression support
config: arm64-randconfig-003-20250121 (https://download.01.org/0day-ci/archive/20250122/202501220648.XAf2N9Ug-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220648.XAf2N9Ug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220648.XAf2N9Ug-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/erofs/decompressor_lzma.c: In function 'z_erofs_lzma_exit':
   fs/erofs/decompressor_lzma.c:42:33: error: implicit declaration of function 'xz_dec_microlzma_end' [-Werror=implicit-function-declaration]
      42 |                                 xz_dec_microlzma_end(strm->state);
         |                                 ^~~~~~~~~~~~~~~~~~~~
   fs/erofs/decompressor_lzma.c: In function 'z_erofs_load_lzma_config':
   fs/erofs/decompressor_lzma.c:136:31: error: implicit declaration of function 'xz_dec_microlzma_alloc' [-Werror=implicit-function-declaration]
     136 |                 strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
         |                               ^~~~~~~~~~~~~~~~~~~~~~
>> fs/erofs/decompressor_lzma.c:136:29: warning: assignment to 'struct xz_dec_microlzma *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     136 |                 strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
         |                             ^
   fs/erofs/decompressor_lzma.c: In function 'z_erofs_lzma_decompress':
   fs/erofs/decompressor_lzma.c:193:9: error: implicit declaration of function 'xz_dec_microlzma_reset' [-Werror=implicit-function-declaration]
     193 |         xz_dec_microlzma_reset(strm->state, inlen, outlen,
         |         ^~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/decompressor_lzma.c:266:26: error: implicit declaration of function 'xz_dec_microlzma_run' [-Werror=implicit-function-declaration]
     266 |                 xz_err = xz_dec_microlzma_run(strm->state, &strm->buf);
         |                          ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +136 fs/erofs/decompressor_lzma.c

    73	
    74	int z_erofs_load_lzma_config(struct super_block *sb,
    75				     struct erofs_super_block *dsb,
    76				     struct z_erofs_lzma_cfgs *lzma, int size)
    77	{
    78		static DEFINE_MUTEX(lzma_resize_mutex);
    79		unsigned int dict_size, i;
    80		struct z_erofs_lzma *strm, *head = NULL;
    81		int err;
    82	
    83		if (!lzma || size < sizeof(struct z_erofs_lzma_cfgs)) {
    84			erofs_err(sb, "invalid lzma cfgs, size=%u", size);
    85			return -EINVAL;
    86		}
    87		if (lzma->format) {
    88			erofs_err(sb, "unidentified lzma format %x, please check kernel version",
    89				  le16_to_cpu(lzma->format));
    90			return -EINVAL;
    91		}
    92		dict_size = le32_to_cpu(lzma->dict_size);
    93		if (dict_size > Z_EROFS_LZMA_MAX_DICT_SIZE || dict_size < 4096) {
    94			erofs_err(sb, "unsupported lzma dictionary size %u",
    95				  dict_size);
    96			return -EINVAL;
    97		}
    98	
    99		erofs_info(sb, "EXPERIMENTAL MicroLZMA in use. Use at your own risk!");
   100	
   101		/* in case 2 z_erofs_load_lzma_config() race to avoid deadlock */
   102		mutex_lock(&lzma_resize_mutex);
   103	
   104		if (z_erofs_lzma_max_dictsize >= dict_size) {
   105			mutex_unlock(&lzma_resize_mutex);
   106			return 0;
   107		}
   108	
   109		/* 1. collect/isolate all streams for the following check */
   110		for (i = 0; i < z_erofs_lzma_avail_strms; ++i) {
   111			struct z_erofs_lzma *last;
   112	
   113	again:
   114			spin_lock(&z_erofs_lzma_lock);
   115			strm = z_erofs_lzma_head;
   116			if (!strm) {
   117				spin_unlock(&z_erofs_lzma_lock);
   118				wait_event(z_erofs_lzma_wq,
   119					   READ_ONCE(z_erofs_lzma_head));
   120				goto again;
   121			}
   122			z_erofs_lzma_head = NULL;
   123			spin_unlock(&z_erofs_lzma_lock);
   124	
   125			for (last = strm; last->next; last = last->next)
   126				++i;
   127			last->next = head;
   128			head = strm;
   129		}
   130	
   131		err = 0;
   132		/* 2. walk each isolated stream and grow max dict_size if needed */
   133		for (strm = head; strm; strm = strm->next) {
   134			if (strm->state)
   135				xz_dec_microlzma_end(strm->state);
 > 136			strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
   137			if (!strm->state)
   138				err = -ENOMEM;
   139		}
   140	
   141		/* 3. push back all to the global list and update max dict_size */
   142		spin_lock(&z_erofs_lzma_lock);
   143		DBG_BUGON(z_erofs_lzma_head);
   144		z_erofs_lzma_head = head;
   145		spin_unlock(&z_erofs_lzma_lock);
   146	
   147		z_erofs_lzma_max_dictsize = dict_size;
   148		mutex_unlock(&lzma_resize_mutex);
   149		return err;
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
