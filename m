Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3039E265623
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 19:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781378356; cv=none; b=c9+c3zC6EZrORFrOjn8fEgZJRlKH94g2RezJkvHV0Rg6Gvh2bcpXexUW+iUoLvO0FH9II20ArIURfIeabH4VwynBuYIpNxqMz9jYoSR0s4hC6ZputFCMnF+HAUXtE7CUGfbvoO3GEdXkn5Q6IeGv0kuTZPM/MD+b3jX0x6A6bHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781378356; c=relaxed/simple;
	bh=oikepVlf3tbJ1Rq64ES4R7R9wWiVVmdzytrJZud97sQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KCe6MySntCE3Bbq/HNQJLqoHciK2vAv1wIi6q0cU9F9ilwrDRX7oEgOnknqKlRtFYUwvYvcjmly7ucZL71XGB/2DvB1PYREHT4mU05Qg2xiICrdTz6/TTgHwCcMV+1jz7r0plhv8GHzht9vYGniANnWPp/QrM7iDmfJUHGmanow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdhNdoXv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdhNdoXv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781378354; x=1812914354;
  h=date:from:to:cc:subject:message-id;
  bh=oikepVlf3tbJ1Rq64ES4R7R9wWiVVmdzytrJZud97sQ=;
  b=KdhNdoXvdxXS3YoMUuQ9kXkH81RE86nhGDQHaf3IX50enYfYK2/n7QBc
   siUiVb7BsB9AgpS5nuRjmHspQJZ4eY+IcqlsOc2Z5BSkrirAsN1QLKSeL
   e66j7pZcqFUe3wuWaiS/91RxLe5ll3XdV54ZRvnHCH8pc3hZCpXCufcAw
   kz9C/sI/DKN5nlRIwU0quOq8kkMIswh6Am3LeY0UhJcgCg+ie/Pa8GhFA
   yXC60SD5v9hZJynxgQhDn5VylNoqJi3E85TzJMCafSGcrlbpXwHkJjszm
   DCU0+7EbXAstdxH3g9tfu4lq/2cmdSEO4bU7xS4wb5wNdHnqGwwBV75iU
   A==;
X-CSE-ConnectionGUID: g91De8JFSjy7oxCAjgmxVQ==
X-CSE-MsgGUID: 4hdIUyrSRzeGfdz3lSS6Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="99756316"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="99756316"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 12:19:13 -0700
X-CSE-ConnectionGUID: z9rGmprlSM+ByIzu/YCDxA==
X-CSE-MsgGUID: 6IoZERVfTq+hkHyV8/4pdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="245989691"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2026 12:19:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYTsr-00000000QD2-1OG1;
	Sat, 13 Jun 2026 19:19:09 +0000
Date: Sun, 14 Jun 2026 03:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: [linux-next:master 9853/13763]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3378
 TruncToValidBPP() warn: inconsistent indenting
Message-ID: <202606140308.5I48COmW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: a7c7b927c8304a2d3bf18f744e3f265e3b8127ba [9853/13763] drm/amd/display: Add DML changes to support HDMI FRL
config: i386-randconfig-141-20260611 (https://download.01.org/0day-ci/archive/20260614/202606140308.5I48COmW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140308.5I48COmW-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3378 TruncToValidBPP() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3684 TruncToValidBPP() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:3790 TruncToValidBPP() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3381 TruncToValidBPP() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1332 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3687 TruncToValidBPP() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:3793 TruncToValidBPP() warn: inconsistent indenting

vim +3378 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c

  3326	
  3327	static double TruncToValidBPP(
  3328			double LinkBitRate,
  3329			int Lanes,
  3330			long HTotal,
  3331			long HActive,
  3332			double PixelClock,
  3333			double DesiredBPP,
  3334			bool DSCEnable,
  3335			enum output_encoder_class Output,
  3336			enum output_format_class Format,
  3337			unsigned int DSCInputBitPerComponent,
  3338			int DSCSlices,
  3339			int AudioRate,
  3340			int AudioLayout,
  3341			enum odm_combine_mode ODMCombine)
  3342	{
  3343		double MaxLinkBPP = 0;
  3344		int MinDSCBPP = 0;
  3345		double MaxDSCBPP = 0;
  3346		int NonDSCBPP0 = 0;
  3347		int NonDSCBPP1 = 0;
  3348		int NonDSCBPP2 = 0;
  3349	
  3350		enum frl_cap_chk_result hdmifrlresult = { 0 };
  3351		struct frl_cap_chk_params hdmifrlparams = { 0 };
  3352		struct frl_cap_chk_intermediates hdmifrlinter = { 0 };
  3353	
  3354		hdmifrlparams.lanes = Lanes;
  3355		hdmifrlparams.f_pixel_clock_nominal = PixelClock * 1000000;
  3356		hdmifrlparams.r_bit_nominal = LinkBitRate * 1000000;
  3357		hdmifrlparams.layout = AudioLayout;
  3358		hdmifrlparams.f_audio = AudioRate * 1000;
  3359		hdmifrlparams.h_active = HActive;
  3360		hdmifrlparams.h_blank = HTotal - HActive;
  3361		hdmifrlparams.compressed = DSCEnable;
  3362	
  3363		if (Format == dm_420) {
  3364			NonDSCBPP0 = 12;
  3365			NonDSCBPP1 = 15;
  3366			NonDSCBPP2 = 18;
  3367			MinDSCBPP = 6;
  3368			MaxDSCBPP = 1.5 * DSCInputBitPerComponent - 1.0 / 16;
  3369			hdmifrlparams.pixel_encoding = HDMI_FRL_PIXEL_ENCODING_420;
  3370			hdmifrlparams.bpc = (int)(DesiredBPP * 2 / 3);
  3371		} else if (Format == dm_444) {
  3372			NonDSCBPP0 = 24;
  3373			NonDSCBPP1 = 30;
  3374			NonDSCBPP2 = 36;
  3375			MinDSCBPP = 8;
  3376			MaxDSCBPP = 3 * DSCInputBitPerComponent - 1.0 / 16;
  3377			hdmifrlparams.pixel_encoding = HDMI_FRL_PIXEL_ENCODING_444;
> 3378		    hdmifrlparams.bpc = (int)(DesiredBPP / 3);
  3379		} else {
  3380			hdmifrlparams.pixel_encoding = HDMI_FRL_PIXEL_ENCODING_422;
  3381		    hdmifrlparams.bpc = (int)(DesiredBPP / 2);
  3382			NonDSCBPP0 = 16;
  3383			NonDSCBPP1 = 20;
  3384			NonDSCBPP2 = 24;
  3385	
  3386			if (Format == dm_n422) {
  3387				MinDSCBPP = 7;
  3388				MaxDSCBPP = 2 * DSCInputBitPerComponent - 1.0 / 16.0;
  3389			} else if (Output == dm_hdmifrl) {
  3390				MinDSCBPP = 7;
  3391				MaxDSCBPP = 2 * DSCInputBitPerComponent - 1.0 / 16.0;
  3392			} else {
  3393				MinDSCBPP = 8;
  3394				MaxDSCBPP = 3 * DSCInputBitPerComponent - 1.0 / 16.0;
  3395			}
  3396		}
  3397	
  3398		if (Output == dm_hdmifrl) {
  3399			hdmifrlresult = dml1_frl_cap_chk_inter(&hdmifrlparams, &hdmifrlinter);
  3400			MaxLinkBPP = (1 - hdmifrlinter.overhead_max) * dml_min(hdmifrlinter.r_frl_char_min * 16 * Lanes / hdmifrlinter.f_pixel_clock_max + 24 * TB_BORROWED_MAX / HActive,
  3401					(hdmifrlinter.r_frl_char_min * 16 * Lanes / hdmifrlinter.f_pixel_clock_max * HTotal - 16 * hdmifrlinter.blank_audio_min) / HActive);
  3402		} else
  3403		if (DSCEnable && Output == dm_dp) {
  3404			MaxLinkBPP = LinkBitRate / 10 * 8 * Lanes / PixelClock * (1 - 2.4 / 100);
  3405		} else {
  3406			MaxLinkBPP = LinkBitRate / 10 * 8 * Lanes / PixelClock;
  3407		}
  3408	
  3409		if (ODMCombine == dm_odm_combine_mode_4to1 && MaxLinkBPP > 16) {
  3410			MaxLinkBPP = 16;
  3411		} else if (ODMCombine == dm_odm_combine_mode_2to1 && MaxLinkBPP > 32) {
  3412			MaxLinkBPP = 32;
  3413		}
  3414	
  3415	
  3416		if (DesiredBPP == 0) {
  3417			if (DSCEnable) {
  3418				if (MaxLinkBPP < MinDSCBPP) {
  3419					return BPP_INVALID;
  3420				} else if (MaxLinkBPP >= MaxDSCBPP) {
  3421					return MaxDSCBPP;
  3422				} else {
  3423					return dml_floor(16.0 * MaxLinkBPP, 1.0) / 16.0;
  3424				}
  3425			} else {
  3426				if (MaxLinkBPP >= NonDSCBPP2) {
  3427					return NonDSCBPP2;
  3428				} else if (MaxLinkBPP >= NonDSCBPP1) {
  3429					return NonDSCBPP1;
  3430				} else if (MaxLinkBPP >= NonDSCBPP0) {
  3431					return NonDSCBPP0;
  3432				} else {
  3433					return BPP_INVALID;
  3434				}
  3435			}
  3436		} else {
  3437			if (!((DSCEnable == false && (DesiredBPP == NonDSCBPP2 || DesiredBPP == NonDSCBPP1 || DesiredBPP == NonDSCBPP0 || DesiredBPP == 18)) ||
  3438					(DSCEnable && DesiredBPP >= MinDSCBPP && DesiredBPP <= MaxDSCBPP))) {
  3439				return BPP_INVALID;
  3440			} else if ((Output == dm_hdmifrl && hdmifrlresult != FRL_CAP_CHK_OK) || (Output != dm_hdmifrl && MaxLinkBPP < DesiredBPP)) {
  3441				return BPP_INVALID;
  3442			} else {
  3443				return DesiredBPP;
  3444			}
  3445		}
  3446	}
  3447	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
