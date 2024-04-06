Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A43F4FB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 04:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712378963; cv=none; b=O1Rq+xacRflV2efXk7Dnda1Qth1tGp8l5MglxIqU7VDWJSjL+gZSdg+shAzCZ1+ykHm4tDt28Kft1AKr5U80TfLmkxQU3ZLImcZ1beOM/H5yhUXZPTEeHx1kJWrUTmZ40wpxlxPrZZMzX7n8Ehz3k1nEh7DE8w6t6Oof7xOnwB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712378963; c=relaxed/simple;
	bh=+XGRTgn4PpfXzaVvIUVPL4retleKZI5hRFFJcuxESrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JX+/dB5pTKZkEffFAe3zSCJ5k/8d2OiisRMwLy1LYXPw/k/qf/oPco0Ef+KbYjUen555WQAPvrbshUCN9D7VI2hj+EiFSmp1lg5/adiUh/TlfxN1ciGqTuD51IPSJtASvAASxUDOZ7OpF9MUYWRw7embiWPOO9WXZ97QDLZm5IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fp9WUfMY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fp9WUfMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712378961; x=1743914961;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=+XGRTgn4PpfXzaVvIUVPL4retleKZI5hRFFJcuxESrk=;
  b=fp9WUfMYxff079BJWuRVj0fwg5Y1rLR2W5asc3QWcGNnO2F3Uz90KFhI
   xB1C6kdF2ZSY+ZmBJrTlPIiS8CJpOl7P/EDe7x32tku9993YAJ0BFjTGk
   iEwpv0tmtGu6eDflrbPsLDn9g34ZJD4FGtfVQ7PJHPDm1X/+Pi28aWAEr
   3Eo4w4aaR4T2YjnNxA5g4XPnNVmUObR7ToPefJ8cVTYT6/m3RfxugWfHN
   XkuK7cdOD8/e1Nifb+zzWuuY5wzb52lOcy0A+O5RP9+BQF/0PmVahDlka
   LV0wDdYIiRhKRoCZvkV04mX9bcv8r9DybQXxs00z1UXj123n7Oo6U+A5A
   A==;
X-CSE-ConnectionGUID: 8GBHLX+gQH+J2SeMjGOPzw==
X-CSE-MsgGUID: WqemmeGmRi6IEAvGPjNA+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7561405"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7561405"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 21:49:20 -0700
X-CSE-ConnectionGUID: lWssvSr3QfmegzXzQ+7Qhg==
X-CSE-MsgGUID: hWKi3/1WSoq/jF0eCzoRvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19380179"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Apr 2024 21:49:17 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsxzQ-00037s-1k;
	Sat, 06 Apr 2024 04:49:16 +0000
Date: Sat, 6 Apr 2024 12:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: Saranya Muruganandam <saranyamohan@google.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] block: Fix BLKRRPART regression
Message-ID: <ZhDULBug77MLdwpp@92629a18465e>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240406044643.2475360-1-saranyamohan@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] block: Fix BLKRRPART regression
Link: https://lore.kernel.org/stable/20240406044643.2475360-1-saranyamohan%40google.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



