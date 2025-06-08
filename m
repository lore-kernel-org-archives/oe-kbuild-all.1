Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5C378C9C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Jun 2025 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749395115; cv=none; b=ELCpYMH2/JlED8T7wmuyZuqQTIChAs3m3mY0e1tG8/RdWMBh+DeqlMUcRt6UAu34xB6eH9vASVs2HhvRlIWS2fL8kf2Yppv6SIEX5euyvcR4mirRp4d98w+43O1NXV8OGsPTxNHzcmvQO6gtUHva8vl3QsOJ5NaMZT+QAUOlZmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749395115; c=relaxed/simple;
	bh=/QikAlWhPpF6AEgZhHEKPXUfz5lsYD4M9mswV0JLjdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=CS9S12eqoZHZx2hfr14zT16k1qQUqqXUXw5+eTTSlfi6QNJdMj5TPc1kcjRgxjK1qIHmG1a0elDAneM3am30vBZnxAKYeE7EC+W2lQubbARGuyUS+/73+Xx9Ibq6MSuQWxcfEENI8L6UYcbqoM2qy7ahBfCbOv3RSnzdCmttk3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUv5Yg48; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUv5Yg48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749395113; x=1780931113;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=/QikAlWhPpF6AEgZhHEKPXUfz5lsYD4M9mswV0JLjdk=;
  b=gUv5Yg48PyXHq/OqC0wSVXoHHT5X70nxpboIQ0MKBEzHxBFkXjy2j23q
   dqet0TBNn83TeO++7AKP56/0n/1clh5aymPLfeZBtzojlf/S4HojEiAs4
   IjjqboBmM3NJTCgiTRR76Xfu5anY2qBWk3g0BLCSvv6A13foYduGr9jEX
   yvGAiO+hBfUGSeJDEHut003AEFWCSUGKN7wFTak/CqkF/wMn3y3H1+H8n
   2krIdi4Qo3x4HV0kVbDhsgQbG/j7NXTIJFdt2pVWc2FuHqS4lzd9MV3Lv
   Q1mfMUIb+/a0eQGlh/reHeUMpWGZzCZfVAUCa4SptBkZCrEXoQzg5oWN/
   w==;
X-CSE-ConnectionGUID: Qao/TcWfRia9B9Dw2LWNIA==
X-CSE-MsgGUID: KMQFY1USTJqOoiq7rmgppg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="69045801"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="69045801"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 08:05:13 -0700
X-CSE-ConnectionGUID: UBI7ZAy/Ssy267mAU791sw==
X-CSE-MsgGUID: yGp5UaEqQve3xpdwLEiX6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="151528759"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jun 2025 08:05:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOHa9-0006Q1-1h;
	Sun, 08 Jun 2025 15:05:09 +0000
Date: Sun, 8 Jun 2025 23:04:40 +0800
From: kernel test robot <lkp@intel.com>
To: moyuanhao3676@163.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] net: core: fix UNIX-STREAM alignment in
 /proc/net/protocols
Message-ID: <aEWmiFPGgBdwJ1Vz@3ff94bb081bb>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608144652.27079-1-moyuanhao3676@163.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] net: core: fix UNIX-STREAM alignment in /proc/net/protocols
Link: https://lore.kernel.org/stable/20250608144652.27079-1-moyuanhao3676%40163.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



