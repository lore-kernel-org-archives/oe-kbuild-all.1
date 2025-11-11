Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173D22C2357
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 14:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762870605; cv=none; b=euE30rJP/+ilSH9ZYf2poRDKR8gOctmQNcFxEdnFyWZQ+3x6aTXIbvnXX8jHL2tnT9RQdEL2n96CWfeKezVDIHhA4W2scfgT7yQ+eOHhyElLL3pOZG8r4tVJ9bpxmhxjDA4H7aTc6qWQ+HN68voQwr5BCimulMBTT5WWcueKjME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762870605; c=relaxed/simple;
	bh=ldd0MBfQA5ahB9OKyLXq2WHwZXflcX6TWBNO30ToaAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LBNN8Pp+7AFi8XAoVccsRF9m+YbvKgdCNpyMyEtugRC96DxP0rkfq13ZQmTcw7tlQ4BSOflzb/KaicTban+CR6Q1Ff4cJbftL/hr6KHgH47lSHXWo5ebFIwh5wbpX/wlfd/K+46YtZ5wFpA0ITxKvsLB3IZdplPRpATF0/FXgQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlvqcNZi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlvqcNZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762870603; x=1794406603;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=ldd0MBfQA5ahB9OKyLXq2WHwZXflcX6TWBNO30ToaAk=;
  b=BlvqcNZi5TJn/5p+Zlba+2UtlBZnzZ08GDYBcpNSL9FMV7+T0tnuqcln
   ATW/+joWO9zHBJF7VuHu34eCq8XQ6w0PFnkvtv4eSBwJsf3wC9ppg3PAW
   t+4bG3Owr4Spz9a/YCYCoXo50EsRFZ/tpgRijrgumLLy/EcemCG9tfPit
   bDxbdnlaaVmmi+A91T2cN9HZOKxDEH3yMPwcBjNI1XbRZG+/ihREnXUYI
   eteEf67NmR3Wk1WXedGpzdzLyVuTWHBmgbCfn9IRC0NAyC8FSuIk+0rAL
   NjWSuMnICJwF0zr6wLsBVvUyrW3a65uiHPHM3mYC4fnaxFh/YiDGLcSp+
   w==;
X-CSE-ConnectionGUID: lDMMy21zRhiQsWpFti05dA==
X-CSE-MsgGUID: L5jBiPMSR7WcMhAwpVKvfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64136065"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="64136065"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 06:16:42 -0800
X-CSE-ConnectionGUID: SMjDAfDfS9CBHQoMWpu3zQ==
X-CSE-MsgGUID: qlZqNdVER5qcM2a5ju8sIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="188811155"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Nov 2025 06:16:41 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIpAl-0003E7-1s;
	Tue, 11 Nov 2025 14:16:39 +0000
Date: Tue, 11 Nov 2025 22:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] usb: mtu3: fix possible NULL pointer dereference in
 ep0_rx_state()
Message-ID: <aRNFFHSnzHjRJqp5@6d04f8574eac>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111140956.3285945-1-Pavel.Zhigulin@kaspersky.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] usb: mtu3: fix possible NULL pointer dereference in ep0_rx_state()
Link: https://lore.kernel.org/stable/20251111140956.3285945-1-Pavel.Zhigulin%40kaspersky.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



