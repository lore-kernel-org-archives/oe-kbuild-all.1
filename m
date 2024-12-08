Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A5313B59A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Dec 2024 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733647357; cv=none; b=XgrRXXwDVEeI5ciCjmqJTh5TazudR/2cLObpUWuBZ7GDcLFWG8it9hJgTrHwQ2d5ENTMyIlploCdUuvIydkF5DPJVK6eDSYJkHSTO5sR5oKvsadmKLclIYkGWwiwYJ0MQhdN1tlZaG03cX7l1Ynq13NJUNuyaamW9rJdWqz3H7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733647357; c=relaxed/simple;
	bh=0SIJDo6MX/QEQO85LU0ihdjDe1Dt56/YEKfiRIPfEqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Y7qLpSOf9nWURsIiTyKNieyEQ9XOq2oc7aLLmTAumPDz4eFiV317ahJlKN+29Rywqedv0HAiarOC8pIYx9H6ZswbowEDL+x1lg0+4rBBgmjvACeqbo5I16GdQUpoogFZk7sjV4q+2ArErp2v5HH+OxuoWr/k12YFWotYhqScQV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmwYF3hj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmwYF3hj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733647356; x=1765183356;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=0SIJDo6MX/QEQO85LU0ihdjDe1Dt56/YEKfiRIPfEqc=;
  b=dmwYF3hjGYnqiUnr9iI7B/g0ceyHsebFpzbwLHpj9IzyxKvKp159fDyM
   yfv1NTHBhwE8P8ynTjPKru2L/RdKgNYlIUy3M9Z0wyuG7esBOyuF1L4NT
   Bjo8kJF2c6IaSjta3fJqqH6VIjGzdBK2GUvO3ZdNXyLRcmu2NymvGFFjC
   Fc/752mRbGvJ5sf5M+XXfwl9jR6jyVrOjo0tBIIDjntXJh9nnpqciSDbc
   gK6GFRQc1buNHQtjai0HgnrpKNbd0+dxpZosGW4WapxqiZla2AnG1jv5c
   P8yEdozUrgdM9gmvqXJJ22j6m6b80/I0JqKVvXa5xfPsahZteNkH5uday
   Q==;
X-CSE-ConnectionGUID: Vs30nvDiSPK2gh3fg+Lj8Q==
X-CSE-MsgGUID: qMd7hmNvQpG++PDiMaK9Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11279"; a="44557420"
X-IronPort-AV: E=Sophos;i="6.12,217,1728975600"; 
   d="scan'208";a="44557420"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 00:42:32 -0800
X-CSE-ConnectionGUID: +5h7JRTCSDeNb6ox4Uv6/Q==
X-CSE-MsgGUID: CT4riyY+TTWJONpXklhAGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,217,1728975600"; 
   d="scan'208";a="94888291"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 00:42:30 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKCs0-0003Dx-0N;
	Sun, 08 Dec 2024 08:42:28 +0000
Date: Sun, 8 Dec 2024 16:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: Nikolay Kuratov <kniv@yandex-team.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 6.1] KVM: x86/mmu: Ensure that kvm_release_pfn_clean()
 takes exact pfn from kvm_faultin_pfn()
Message-ID: <Z1Vb6mMqvlZHBQ8z@a512c14b2e7e>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241208083743.77295-1-kniv@yandex-team.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH v2 6.1] KVM: x86/mmu: Ensure that kvm_release_pfn_clean() takes exact pfn from kvm_faultin_pfn()
Link: https://lore.kernel.org/stable/20241208083743.77295-1-kniv%40yandex-team.ru

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



