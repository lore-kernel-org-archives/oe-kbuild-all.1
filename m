Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEF212881C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708954073; cv=none; b=DAFhfgtoc2fW6Vs7xUzFuBm/WPlwjGyxW6xvY9O6/h7Dr/sdLcJudsAVtRewfEoOtQYgrfFIf0ZAAr34mpA/A51WPKXBLxa5NhJ9/nJHUNjVswMCn1xNotHp9AwWvHGBPHDdFICZEkNn0cuv8xEl+748h3xJSltwmMbnWuuTWfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708954073; c=relaxed/simple;
	bh=Yp2WfImxCgs2OwiIkO+unVSXAs1eUBxf6I15EwXKCp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Pe8NyW6HumiuHUq0FWx/TZuXSpyNKwMLvk7MH4JsKHyZm2BTZQVXhDXEJ8nEo7OvuG8MJGYRUJ+EYZx26polEmj0QKnNe2WZtCYIUMUMtVp7ddg2fb3Fk8JUgAvp2xpVR4737G3SweS3SXVqmK2ELoYo1WtdyaEw9uwcFFDzR/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TROu9EVH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TROu9EVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708954071; x=1740490071;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Yp2WfImxCgs2OwiIkO+unVSXAs1eUBxf6I15EwXKCp8=;
  b=TROu9EVHqvCCrkvQmKv1fZw/VFV8GwpfHU9OwuBZJQJqGh1DBXX5a1SE
   Y7vEdv6zGU10C+MmhlQNydD8dO2em4CSUjibYjZjPKRUyz0VhQd2ULYQG
   BLXnZP5frO9YruXK9YxjOsGaOIp9VtxURpLjjBQ4Y9wH0QNZGCgqrId94
   7MrOlqlYuRMetAKor21Sjl4GvLe8GdKeiD0PEwhCtYocBG0rnZix1o8TS
   txM14cUeRLg8f7D/Bo2RXkbKvAqflMT2Wx0DLLGgJgsjcMX/qaQQYOMoi
   Tuwvvm07kQ8eqz1m4CPdGPx0peIE/h6DPH5qDiPnrv0HKzJteLw/Klc9Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3095968"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3095968"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 05:27:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6552767"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Feb 2024 05:27:47 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reb1F-000AK8-0O;
	Mon, 26 Feb 2024 13:27:45 +0000
Date: Mon, 26 Feb 2024 21:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1] net: sfp: add quirks for ODI DFP-34X-2C2
Message-ID: <ZdyRhXbyryV6PM0i@fdb2c0c3c270>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3P286MB2611C0FA24318AA397DB689B985A2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v1] net: sfp: add quirks for ODI DFP-34X-2C2
Link: https://lore.kernel.org/stable/TY3P286MB2611C0FA24318AA397DB689B985A2%40TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



