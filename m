Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA12621CC60
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 06:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761028331; cv=none; b=HjaxPgfm2SWbbT6qSGWFdf7BmCTVbK5Kyusias6M95Sle5QmUc0w6u+JqO9WIbiFa6yQ8GlqxO9ogVW2Ph1+3BoHQWAyLF0clyeLU088z4ceKHU6NEDAVdEODCpwLyUmnGAF0s3oKLp8S93xjroZJpwiUVTbXjfPNenalgekk2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761028331; c=relaxed/simple;
	bh=tK9wL9GAGgvPSgHFwjFe0k/VOkuztzO4GvjqWdOFYow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ija693y3rM+YcLVoCfkq7B+1azC4Mnn93t6EXtFS0I6OuDwF02o8/oMZx7LW9Fs0SQ2S/LASr74N58A6Nk38RKlvSNKV/tS1axwESHRAX2W2/zZOf01c/PX7GMzKeW7PtryYxGDzlwIuhVJetn5DHQj8vus99X9DI7oQkivpNro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngDM3eCs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngDM3eCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761028326; x=1792564326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tK9wL9GAGgvPSgHFwjFe0k/VOkuztzO4GvjqWdOFYow=;
  b=ngDM3eCsjeVfMAk/m+33DRkBK787qNNcg8Gd468IHbOfbxzfOCLA8tD/
   6PPPlL+As45geNjcMHF0xWMCXt1dCqYoxl/A5dAEej+f9EDEJjTr72Oyr
   MT+i0/v5mXhZ6l9/lsTqoVHwYXxkfamtaYif9f2fWy33ZzNQDJQ/zOll9
   fJvNPUWXHfQqgBcsd+BYQs2lOexhjdldfW7+gQUT3FHnsN5fIvFAG1r6L
   g0X7sBswde/Ham140CqlWswEaFcJV8NZuqKTinV4CTmTsn1prERv9xAmk
   /l27YTS7Wk+dQ3aZMPqt9BTPPwlTxCIUo42P5NzBGQbTP3MBLBqu2ovNC
   A==;
X-CSE-ConnectionGUID: dl3eGuKhR3qVMxQk7k9XkQ==
X-CSE-MsgGUID: q2htcMybS++niFvHsyDzmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62179807"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="62179807"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 23:32:05 -0700
X-CSE-ConnectionGUID: OEUvkj5fRueZuhvT7jMHIQ==
X-CSE-MsgGUID: 41aRMcsESXmA97kembgDYg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 Oct 2025 23:32:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB5uc-000AYH-0L;
	Tue, 21 Oct 2025 06:32:02 +0000
Date: Tue, 21 Oct 2025 14:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 1/54]
 drivers/media/platform/apple/isp/isp-cam.c:378:21: warning: format '%lx'
 expects argument of type 'long unsigned int', but argument 3 has type
 'size_t' {aka 'const unsigned int'}
Message-ID: <202510211419.8TFzzi7C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   e341186f8171815b97224ee45c81a5815e95e073
commit: 4041d488626acec0eac1e8f4d16c829a6395ff33 [1/54] media: apple: Add Apple ISP driver
config: arc-randconfig-r132-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211419.8TFzzi7C-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211419.8TFzzi7C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510211419.8TFzzi7C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/drm/drm_print.h:31,
                    from include/drm/drm_mm.h:51,
                    from drivers/media/platform/apple/isp/isp-drv.h:12,
                    from drivers/media/platform/apple/isp/isp-cam.h:7,
                    from drivers/media/platform/apple/isp/isp-cam.c:6:
   drivers/media/platform/apple/isp/isp-cam.c: In function 'isp_ch_load_setfile':
>> drivers/media/platform/apple/isp/isp-cam.c:378:21: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'const unsigned int'} [-Wformat=]
     378 |   dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |                ^~~
   include/linux/dev_printk.h:154:49: note: in expansion of macro 'dev_fmt'
     154 |  dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-cam.c:378:3: note: in expansion of macro 'dev_err'
     378 |   dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
         |   ^~~~~~~
   drivers/media/platform/apple/isp/isp-cam.c:378:45: note: format string is defined here
     378 |   dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
         |                                           ~~^
         |                                             |
         |                                             long unsigned int
         |                                           %x


vim +378 drivers/media/platform/apple/isp/isp-cam.c

   361	
   362	static int isp_ch_load_setfile(struct apple_isp *isp, u32 ch)
   363	{
   364		struct isp_format *fmt = isp_get_format(isp, ch);
   365		const struct isp_setfile *setfile = &isp_setfiles[fmt->id];
   366		const struct firmware *fw;
   367		u32 magic;
   368		int err;
   369	
   370		err = request_firmware(&fw, setfile->path, isp->dev);
   371		if (err) {
   372			dev_err(isp->dev, "failed to request setfile '%s': %d\n",
   373				setfile->path, err);
   374			return err;
   375		}
   376	
   377		if (fw->size < setfile->size) {
 > 378			dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
   379				setfile->size);
   380			release_firmware(fw);
   381			return -EINVAL;
   382		}
   383	
   384		magic = be32_to_cpup((__be32 *)fw->data);
   385		if (magic != setfile->magic) {
   386			dev_err(isp->dev, "setfile '%s' corrupted?\n", setfile->path);
   387			release_firmware(fw);
   388			return -EINVAL;
   389		}
   390	
   391		isp_iowrite(isp, isp->data_surf->iova, (void *)fw->data, setfile->size);
   392		release_firmware(fw);
   393	
   394		return isp_cmd_ch_set_file_load(isp, ch, isp->data_surf->iova,
   395						setfile->size);
   396	}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
