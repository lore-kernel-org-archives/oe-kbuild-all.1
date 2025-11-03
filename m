Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0611B31987E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762188050; cv=none; b=LOm/V0D7Q9/sAWt9Xs9vVv5reQjNDqaxVlOfrV/Iq/eyJOtqKW7clGrgvJtHM+CIctkMH5hh4JkOXMtmElzDxSNDQwLw+Le607sn+GeKRXTr6z72pc1r4QEy0GMP4+Xc066A0/c6lUdbiNfoGhmli+Dwg1QBbD8PQK2nRJO5flI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762188050; c=relaxed/simple;
	bh=JKuoUwqSwLo2lwHsb5a7l4EiXMPwUHEImtLVOnr5h78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WpkNK1Kv61aXKiXGzhhyqXgVRpuEO3PiTwIaSh5DsQC5lKYn3SHCRJS/p4ftVXgFrPQNj7ryNGi7k51oPZOVpeItusYD8i04osh2IyPFGeTZ+E5dcPQSpGzvppKNv4FXOf/UxAehKGWiKAN1Twv+L29eLgcZXmQ99fOxVMuuAek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=carfPFij; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="carfPFij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762188049; x=1793724049;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=JKuoUwqSwLo2lwHsb5a7l4EiXMPwUHEImtLVOnr5h78=;
  b=carfPFijA+gR2sfQb7xiA7+Qjmo9bmduhwZ9Rwh9H/jaZz8aYwXLUWxR
   hvyDAHFt50/spvFbQq3RVU8H0YOt/r7feVb8Fpy4qkEqsnhX2G2XFabGR
   Ri2NE09X84ECY5MUA+U6+AMxvfo/MqvLyf4IPWPDCDqyfcDgjeNu9/aey
   ss3yGztLG71cmSWSm015GCybTrpAQnIiPELI7c9CUy/h1Gl+UWPXpJUZN
   rEx9x8nyi7wBDC802bqAh23+n6jJerQp7a5nQFcvrD6Rq/LMBGTFM4hRr
   3SzCTfhkptumXa5l5NFqFgn/qyAju3iSHxDaALbU7DUUCRnnzKWMlntdI
   Q==;
X-CSE-ConnectionGUID: Jg6+tx4YRNqBUwxRlkJPAA==
X-CSE-MsgGUID: f/6K5r4SRbWNOaM+PXVA4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63964152"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="63964152"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 08:40:48 -0800
X-CSE-ConnectionGUID: tjNzkf4TT7eRvtHTTP3m2g==
X-CSE-MsgGUID: K3jhewOsTTC6AZnXHsYLBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="187226456"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Nov 2025 08:40:46 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFxbR-000QLk-1b;
	Mon, 03 Nov 2025 16:40:26 +0000
Date: Tue, 4 Nov 2025 00:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 5/5] block: add __must_check attribute to
 sb_min_blocksize()
Message-ID: <aQja7M15mAY8CPbE@8e98f3e9fd5c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103163617.151045-6-yangyongpeng.storage@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v4 5/5] block: add __must_check attribute to sb_min_blocksize()
Link: https://lore.kernel.org/stable/20251103163617.151045-6-yangyongpeng.storage%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



