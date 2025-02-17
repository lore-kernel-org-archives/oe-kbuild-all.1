Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEFE1A3A94
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739794715; cv=none; b=aPOoOE6pHuxxVMsgcpXWUg7ciSPkPEeMRXZijA5WVE64GD9uvIrZPBs4KWZj3nDvPE0sD1ggC/Vd+rbdm6SP26wecSg8N6O6v31zPXJqGGBgh8fDGpAm5D3ge7kVocpjU5UholQYU0DeNDey/ZFhusAsEu7KCD7ddjMyvk77Ooc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739794715; c=relaxed/simple;
	bh=mm2jN73fWCk+HcJNQBGHwKZAJn1ZU9V2JqURczNe+1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=APRAfXmZ6es2671ujekAMWFYXE2Kg/oFhp3/LvOLXHD2P+VlYYNLkPCWf1fKCAmdSYmLy5hFtY4pee2ECOXsceE2UWywJQaXM2q0h2omDx7nFBA9PBCZhnV60zgfTGHgeGLR78LLh3PBUfJ1Kc406tzsr9rOFM+/Xr1I2bF2Cqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSHGwpCf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSHGwpCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739794714; x=1771330714;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=mm2jN73fWCk+HcJNQBGHwKZAJn1ZU9V2JqURczNe+1o=;
  b=lSHGwpCfkHx+KdW788Q1zmGTg4QDB/XSl+7YESWOzzp4g/tNRvS0tIgs
   eHd7lXggHaDNAFg8sY8dZVugn6QSOyYq4ze2+nk0NjKABe5dozlFnAmRc
   Mw0IkOO0JXxHXg9P9SIjSkqNm0F6y9F16OMvOg4LKzdBEtd3phI4MHlyr
   xUF9Jr5GrVUDobayp71taLIR1+OZh1LuHKFRfBopf82Y8RRZRY0dnFLsm
   74UK1FbncDWAIh2mhHcb1FZG6kAHtnZzvBrH2Dmr0F0wCAmMfa0pUgV7/
   UT2EO3w8kWIh4a+CT4g3ITdHOGtvNyd09NvRH+nLyu0jcqHQTToNYlFmo
   A==;
X-CSE-ConnectionGUID: SnEL3xBLRz6F5YLSkkm6qA==
X-CSE-MsgGUID: eyeIeRXOTgaH6mTx8ibRNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="43304742"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="43304742"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 04:18:33 -0800
X-CSE-ConnectionGUID: eYGIW3pBSzSnpUtx/NPBkA==
X-CSE-MsgGUID: fu67Q/+MQSmHHQd2b+en4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="114308184"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Feb 2025 04:18:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk050-001D5r-0q;
	Mon, 17 Feb 2025 12:18:30 +0000
Date: Mon, 17 Feb 2025 20:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: John Veness <john-linux@pelago.org.uk>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] ALSA: hda/conexant: Add quirk for HP ProBook 450 G4
 mute LED
Message-ID: <Z7Mo7QVdl7-qa3BF@a8a2e957b38e>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fb55d48-6991-4a42-b591-4c78f2fad8d7@pelago.org.uk>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] ALSA: hda/conexant: Add quirk for HP ProBook 450 G4 mute LED
Link: https://lore.kernel.org/stable/2fb55d48-6991-4a42-b591-4c78f2fad8d7%40pelago.org.uk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



