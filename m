Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE1229B0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 04:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711429072; cv=none; b=fqQokrm2D6LZ3xeGeVY9ZUVnMq9BGn4/psEgBzj5qdGBu/aezLVOqy8uKKMFnFIYvVEnFBOvB2G5CqAsxd9ewI98lGQ8YiChc9zrPYhEETRyRL7u7EVmXqWZ21LXnoU2vj5TUASncREWCtZ+OzyC1iyaotBAVdBoysgiw6b9s/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711429072; c=relaxed/simple;
	bh=qY7Xc9qWbWQ5VOjYQ73KnTUAFTRYvBX/4bioXz9u5ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mHmtvxuyS9ePCz79+0871pjKjSbXNo7StHT4uybfAJUL6M/i+JtDs0msur6mOEFDnieifYTH9sh9BPtDWkdkGoDN6TPgF07hlXowF+VYFMrE38+3UbzgJAd5Wnm5cTihqRNVzCYjN4DE2ADrKSAvyb7KK6SAR4stan/ENRoLr8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKQ81O72; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKQ81O72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711429070; x=1742965070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qY7Xc9qWbWQ5VOjYQ73KnTUAFTRYvBX/4bioXz9u5ZQ=;
  b=MKQ81O72UrNoogm8MdfESWKPLhKHES5Ad01FRvB9CFhHahc6vDlNd806
   qKi1dkdPcrBGWf5IWC/eFVfuvDIrWcGlLUN1U42xyS9U+3bV30xqH1feK
   QAKFrZwIaDGvIwlSHHnkvY+/Im9h0gbJMtb1XCD6e0F+8vQoaAavEy/Sx
   eaZ/kLtX+naXG6toPRU5y8kaqi8aP2ExjUoyqi651TxG2wS3Opwvu6c73
   /hspcSmOxpvd+TEmATSUJ7z3WbPyUzPNjj96nlqKEiShyKX1uwnxVpvVJ
   wjQ+kZGiIF0Uh0Ltrw9vxdf1W0LggiPWh9vShbD+8p71035iUStu/mX6l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17192289"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="17192289"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 21:57:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="15809188"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Mar 2024 21:57:48 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roysc-000N8g-19;
	Tue, 26 Mar 2024 04:57:46 +0000
Date: Tue, 26 Mar 2024 12:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 1/1]
 drivers/usb/gadget/function/f_midi.c:796:3: error: call to undeclared
 function 'android_clear_midi_device_info'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202403261236.8kinbtzg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   53eddc82c2035bd38b19aac93e5ce15fa67787e3
commit: 53eddc82c2035bd38b19aac93e5ce15fa67787e3 [1/1] ANDROID: usb: gadget: f_midi: rework cleanup path
config: i386-randconfig-015-20240326 (https://download.01.org/0day-ci/archive/20240326/202403261236.8kinbtzg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403261236.8kinbtzg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403261236.8kinbtzg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_midi.c:796:3: error: call to undeclared function 'android_clear_midi_device_info'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     796 |                 android_clear_midi_device_info(&opts->android_midi_info);
         |                 ^
   drivers/usb/gadget/function/f_midi.c:796:3: note: did you mean 'android_set_midi_device_info'?
   drivers/usb/gadget/function/android_f_midi_info.h:95:19: note: 'android_set_midi_device_info' declared here
      95 | static inline int android_set_midi_device_info(struct f_midi_info *ctx,
         |                   ^
   drivers/usb/gadget/function/f_midi.c:1315:2: error: call to undeclared function 'android_clear_midi_device_info'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1315 |         android_clear_midi_device_info(&opts->android_midi_info);
         |         ^
   2 errors generated.


vim +/android_clear_midi_device_info +796 drivers/usb/gadget/function/f_midi.c

   789	
   790	static inline void f_midi_unregister_card(struct f_midi *midi)
   791	{
   792		struct f_midi_opts *opts;
   793		if (midi->card) {
   794			opts = container_of(midi->func.fi, struct f_midi_opts,
   795					func_inst);
 > 796			android_clear_midi_device_info(&opts->android_midi_info);
   797			snd_card_free(midi->card);
   798			midi->card = NULL;
   799		}
   800	}
   801	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
