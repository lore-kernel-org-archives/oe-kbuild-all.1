Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2983BB48
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 03:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727665427; cv=none; b=eDIDa/0TEYmqDYF/zI0/n2mtI0cEsyE0zxLqTPBvjJdf1CPKw00G00BwFGBoX0aCpgqHG+E7AkiEio6cW/RZu3x613eK1DRntZs1tdbUvRyWmfWPhErxJXndBkuIXonNzTMDliJumY+PKx5O2oQ8MHzoRpMvMGiT9O7cOcIJt/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727665427; c=relaxed/simple;
	bh=/Ev8YmRlConxYYOWg05RjGxsAC0aDTnNFQeIqWBPq3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nb7TmAzmOrfxAK44pPkIyN/5sakwquae2eQD30fADq7mqZriCYaVrsHfkG8aTF8n+5xCeKMKsc6z/eF+IOi2SnstmdKJbyWWZZ5QWLzr4K7oIhgwJXntsPBIOk3cf1JS186DLRalRJcTh09e6I+lMPWa3tb0ckzEbQsh01syd5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEFdUW8A; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEFdUW8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727665425; x=1759201425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Ev8YmRlConxYYOWg05RjGxsAC0aDTnNFQeIqWBPq3Q=;
  b=ZEFdUW8AIUv6mVXyz+C7q9mdA9nKiAJWKcD2LjKhU74EktSgMUlaZob9
   P/Pm0W2+BiN64KeaoMok5OR7BitXOAAmyzH0sAbS138fzM9Gf6OJNlML7
   ApwVAjXuxrEfwQqvNz7W66SLfoe3cyCTZjoyGnxJQW2DEjV25uV1szutI
   LlvOt/YAZkP3SdZinT94t8m0nGVnTfSn59FN7kYT0m6Slxk73v+kZYPMN
   XA9mFd6igQbtmRQXCs63b+0LTSBse11a+DELrPLy4wwspHsq+2uIXoklx
   TsgdsTQEBvnYaC1luH28zpAzzqKYkOlUeyqKns6lg/+GAxjRqBblj1gMB
   Q==;
X-CSE-ConnectionGUID: WUqK4XK7Twu19XWz/OHPAA==
X-CSE-MsgGUID: N3yPtUEWSFOnCLgZlhJyTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37410704"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="37410704"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 20:03:45 -0700
X-CSE-ConnectionGUID: 8hCFWbg6QJOOOmfjXF4jQw==
X-CSE-MsgGUID: S/f01glwTpeu4oV50qmusw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="77544929"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Sep 2024 20:03:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv6hK-000OyX-0M;
	Mon, 30 Sep 2024 03:03:42 +0000
Date: Mon, 30 Sep 2024 11:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip-rebase 139/439] ERROR: modpost:
 "rz_mtu3_shared_reg_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
Message-ID: <202409301014.xnhHc781-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rebase
head:   f8d1ff00b72f9b6d102d07fa33d364e7da2af7b6
commit: e544d5fcd49b65933f663d0bea057b975c884171 [139/439] mfd: rz-mtu3: Link time dependencies
config: loongarch-randconfig-002-20240930 (https://download.01.org/0day-ci/archive/20240930/202409301014.xnhHc781-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409301014.xnhHc781-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409301014.xnhHc781-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/rtc/rtc-at91rm9200.o: section mismatch in reference: at91_rtc_driver (section: .data) -> at91_rtc_remove (section: .exit.text)
WARNING: modpost: drivers/rtc/rtc-mv.o: section mismatch in reference: mv_rtc_driver (section: .data) -> mv_rtc_remove (section: .exit.text)
>> ERROR: modpost: "rz_mtu3_shared_reg_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_32bit_ch_write" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_16bit_ch_write" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_32bit_ch_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_16bit_ch_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_8bit_ch_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_8bit_ch_write" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_is_enabled" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_enable" [drivers/counter/rz-mtu3-cnt.ko] undefined!
>> ERROR: modpost: "rz_mtu3_disable" [drivers/counter/rz-mtu3-cnt.ko] undefined!
WARNING: modpost: suppressed 1 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
