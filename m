Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D11286426
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 15:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755617342; cv=none; b=W/6HA/s4wSxrllUBGmSIFh6R0o3OKP9CVcy/ZuNuI54/ZL9C++XD1uQ5axIdKNkV7PpLzTmLqoquAApd2SCiuKFog1BpFnkRVpkeHksgLnCNBQ3M4+8iLVzoZlvgVOfPdoLv132Zqh6d976MeeHLZIgIs9cN9ajPUvMMGq+cKvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755617342; c=relaxed/simple;
	bh=zb/vJ7IFnS9w+OWYiVl+1xbgQEvCF1ZjNdfzHcG8J/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lmmToKXgk1mwFjGmKveTZe7Dh4/NvVtqnTfUpThbY7WxGUWEH24k5JgwujxdiHXo4DKc8FUJ0TqI/6k1CoDzkGUyC333gHntJcuOTTLYbuz0gm5ncUeZ/wseiVTxfON6+dUi/XRgP0GwDih9kXtueFmjmzvVuFPgtfnpDT2puXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQvhuj86; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQvhuj86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755617341; x=1787153341;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=zb/vJ7IFnS9w+OWYiVl+1xbgQEvCF1ZjNdfzHcG8J/c=;
  b=KQvhuj86MUCJuco8w4VcJZOnPWVkQ+ZIvI4r1Ak9sPu8osmTdKT2+FJE
   45yLGS8kPv45XsGZPLguZfrZ7bq2RK6rVO1L8BOs2Lb2LSMACGe8VyOPo
   Zja1EbuFP3KSYner8Us2GClNN1rKXfNtBA1etHwTugI0OjdwBd5FkglnP
   LqnR/i8Ibnsef/XKPlaJhXejNeGaHR0gCli96oy2XhjfTLxGBJx+3Yf10
   +yh1fr7oZLrTZAuxQu99Luo0AJu+dWlJStN6fr61SeqiXegtt5OHR84Bb
   81s8P6QKVMfn/lDX3MJdIPXazjyED7utmCqDgbvE16V8GmIxpjysJmgPz
   Q==;
X-CSE-ConnectionGUID: 5aTp/BNmT9uP/T7kBId5PA==
X-CSE-MsgGUID: WpmnTKoISWCDKCFoHS9Liw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="80459511"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="80459511"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 08:29:00 -0700
X-CSE-ConnectionGUID: id1cJsy+T+C8pDSLQ5dYHQ==
X-CSE-MsgGUID: IdErBmbASni0LYRg9XD70g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="172110454"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 19 Aug 2025 08:28:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoOGe-000H3z-2Y;
	Tue, 19 Aug 2025 15:28:56 +0000
Date: Tue, 19 Aug 2025 23:28:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] cifs: Fix oops due to uninitialised variable
Message-ID: <aKSYMfOK2QSkb1SN@b34aff237e16>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1977959.1755617256@warthog.procyon.org.uk>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] cifs: Fix oops due to uninitialised variable
Link: https://lore.kernel.org/stable/1977959.1755617256%40warthog.procyon.org.uk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



