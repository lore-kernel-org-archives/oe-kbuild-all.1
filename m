Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AD5746E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 11:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733311186; cv=none; b=mrRRHjAeJQi1OcfL8e8AySMwBxTA4dFZ1YUUMSft0OAWOcXCcR6qBUYt6w/ljOvrVGM8rssr0YF4bvQo+H+s53aGGUdPovlCtm+5XDHm0ya78v2gQZqnbE2Wtc8k0zrM4+u6sKMajmaB7Xf6q+ocx2uHdAim2R4+Ef6ALucwSsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733311186; c=relaxed/simple;
	bh=zo98QUmWYP5xVKModXoxoA7BQvR/IIKZRxQemLiJBcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSZXfy65ntuXTomMSMY1WsGskRI3vas0HltMif7URLZEqykmAgVdmD0vjm8H2d3VmtGiwclZlvcW1mUIw+B2PQnsoH9Ry9V3lvaqdWPuq4ZSBqvV6WZvU0+xrGQMpvedEHXLuldDeEmbFtnLAh+h7VkCPOsVogG7wX+pw6uHZ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1FBA1063;
	Wed,  4 Dec 2024 03:20:10 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F24C93F71E;
	Wed,  4 Dec 2024 03:19:41 -0800 (PST)
Date: Wed, 4 Dec 2024 11:19:39 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: Levi Yun <yeoreum.yun@arm.com>, oe-kbuild-all@lists.linux.dev,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [linux-next:master 1570/1720]
 drivers/firmware/arm_ffa/bus.c:119:1: error: parameter
 '__UNIQUE_ID___addressable_ffa_bus_type387' is initialized
Message-ID: <Z1A6y-IqEeFw9X51@bogus>
References: <202412041616.saBqc9dh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412041616.saBqc9dh-lkp@intel.com>

On Wed, Dec 04, 2024 at 04:29:47PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   c245a7a79602ccbee780c004c1e4abcda66aec32
> commit: cc5d45d2f1eb624c0ca77ea4fc57edc611e0ec34 [1570/1720] firmware: arm_ffa: Fix the race around setting ffa_dev->properties
> config: arm64-randconfig-002-20241204 (https://download.01.org/0day-ci/archive/20241204/202412041616.saBqc9dh-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041616.saBqc9dh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412041616.saBqc9dh-lkp@intel.com/
> 

Sorry for this. I had briefly pushed a branch with the issue I created while
formatting a patch that was applied. I had fixed it locally but failed to push
it to the remote in time to appear in linux-next. It should be fixed in
tomorrow's -next.

-- 
Regards,
Sudeep
