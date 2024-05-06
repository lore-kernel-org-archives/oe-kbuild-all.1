Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC03156960
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 17:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715014819; cv=none; b=DUWE9Ox7DJWhakh8hbD3q7sfZ8M5HQKYOF78d3GoKCpvWztS6fMskukfur0R5HBObxctBLGQ9wTnO4dBfxDP48IZ5ujdo8yYJyZwazuJAvWMlNdG7yz3yb7SPeYD9jCp3FGr6tsGXVma4/L5MOZ56ceW+7h5O8xV08HUEEYpcaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715014819; c=relaxed/simple;
	bh=rJcd5caZZhKGE6xxpCyv8yduuhfoNv6L1PORou0rdEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SPF0pMQaWZC45agV+cY31SQX4c1SZCRMXlvG5VS1MPFu+tsAGLGwSHpg7Gzrvhv6h4HZaWGB6c9TAOZ2CSDImu19fPTgkxn6+LnmQng4A6JGM1K973MafBbM3iXaIGla6+9nx/FuF8E8DjTmxYL8ymzhSkMonUSmghFQV0LuR7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnKMmrDd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnKMmrDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715014816; x=1746550816;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=rJcd5caZZhKGE6xxpCyv8yduuhfoNv6L1PORou0rdEc=;
  b=CnKMmrDdcRZNiSZkm1E/sBMottOQuBlztkNSCOkVQ7h1OwapdsjIERsG
   cwej2iBtkTRayOREHhs3ymPBq00xGPjZagXdf9SiELx4ao1wad4nD69Qu
   6e7AJVBT0vF+iAmtXDb6MIXtwF6NMdKJBnO6MxGsZum7llO1Y6khEq53v
   7NfKgodRtRXte2bfR96abynjEoQtCZbwxuY4dsTnxYHHhmgfXq88wtH6m
   NacwcZLu7cnyy3MRuy5KG0t7De0oKf4qFRUkVhtTRGfYlU5+HdiH5eL3A
   TTNVe6opW9/k4n5ROOSmAj8FbPcYOdStzmJjW9tOND37pt+gvHjRey++8
   w==;
X-CSE-ConnectionGUID: onquY1pLQ96oWEy/AyoByA==
X-CSE-MsgGUID: GnrqYKUAQyKPyOKKpdNJUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10933871"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="10933871"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 10:00:13 -0700
X-CSE-ConnectionGUID: r+q5Y2VGQlOdGM6RrPnS5A==
X-CSE-MsgGUID: +VuqpKQeQ9mchrFJkxho+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="59082991"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 May 2024 10:00:12 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s41hB-0000os-1K;
	Mon, 06 May 2024 17:00:09 +0000
Date: Tue, 7 May 2024 01:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 03/10] selftests/harness: Fix fixture teardown
Message-ID: <ZjkMk3aG4A-swvNi@974e639ab07c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506165518.474504-4-mic@digikod.net>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v6 03/10] selftests/harness: Fix fixture teardown
Link: https://lore.kernel.org/stable/20240506165518.474504-4-mic%40digikod.net

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



