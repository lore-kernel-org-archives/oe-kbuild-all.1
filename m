Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168003C2D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jul 2026 04:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784088116; cv=none; b=uHmWUFuDMLv/yYDdSjSYmPy+UcNFn+Eior9M4JYovmd8y6aCjafUYdnipr3voatYXo399+2p1sYlnNiCcnDhTWauO9p2irqz487w6d2Q0PBzcTHBSOzKxx473jA5H0YeOJ2pRDdXYXREa3bRhFBL5Cf3HOUhIoGoHuWHWjgQY+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784088116; c=relaxed/simple;
	bh=5AJJsRpyYtSZqjnFUuo1zsAdOCizExAAGxBDIeEJrpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBIvI6iYzL+7F5P0sW4lNk272cfYiiTjriIUbbEdwMNyCLqSz0LoVFrgBfLHxuWJ6tm1cDx4+k5PVG/RiO7OwzEKLMxJp4vOSU1Bx6NUqM1idRKVMFLA+b8BqmgBDIku9xQPbaRkWRUOYzymMDDCY+hEF0ocL/ncLB1LsyreBbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n926Dhed; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n926Dhed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784088114; x=1815624114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5AJJsRpyYtSZqjnFUuo1zsAdOCizExAAGxBDIeEJrpI=;
  b=n926DhedXX5qhZ8+BhU3TmnipIcmE9CA5jPv2wcnDNO1W+evFh4Zjmdb
   I2nunIjfud39sDPbKaLaQROPCE61NVqDXca953N7QMlwp3XXqest2ujaE
   m6b3PbawrcqloRKtSqGFeTW8VS746b9jylkgNBNKXYqTpstmNcd6Ah0U+
   QzZVInnIRyyHRYG8xOmzKrDSqn/TwV7jtDZM/61thZIuNfADPRryoU2nK
   Yzs7ZmCcDxXWOPbR9RCgk7plxoXoI8OlWkqgLPciwgpCdDkHbNfZF44rE
   H0pUCSc8OmEl3SIt6hcwFjstewH083DTvX+N6jje8tzcf803WjXZeBZzM
   A==;
X-CSE-ConnectionGUID: xn5dZ899RKGZY+aaUIZQuA==
X-CSE-MsgGUID: BTZJsgTwQAuuyfXgX0AzPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84913226"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="84913226"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 21:01:54 -0700
X-CSE-ConnectionGUID: 4QNuT6xvQdSRRrDVzfZ4+Q==
X-CSE-MsgGUID: xSjqqebhSBqCberCRx3fBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="286121459"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 14 Jul 2026 21:01:51 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjqof-0000000049t-02ZM;
	Wed, 15 Jul 2026 04:01:49 +0000
Date: Wed, 15 Jul 2026 06:00:48 +0200
From: kernel test robot <lkp@intel.com>
To: Weiming Shi <bestswngs@gmail.com>, Jon Maloy <jmaloy@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	Tung Nguyen <tung.quang.nguyen@est.tech>, xmei5@asu.edu,
	Weiming Shi <bestswngs@gmail.com>
Subject: Re: [PATCH net v5] tipc: serialize udp bearer replicast list updates
Message-ID: <202607150523.48dOIqUE-lkp@intel.com>
References: <20260714192140.1810202-1-bestswngs@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714192140.1810202-1-bestswngs@gmail.com>

Hi Weiming,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Weiming-Shi/tipc-serialize-udp-bearer-replicast-list-updates/20260715-033047
base:   net/main
patch link:    https://lore.kernel.org/r/20260714192140.1810202-1-bestswngs%40gmail.com
patch subject: [PATCH net v5] tipc: serialize udp bearer replicast list updates
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260715/202607150523.48dOIqUE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260715/202607150523.48dOIqUE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607150523.48dOIqUE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: net/tipc/udp_media.c:106 struct member 'disabled' not described in 'udp_bearer'
>> Warning: net/tipc/udp_media.c:106 struct member 'disabled' not described in 'udp_bearer'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
