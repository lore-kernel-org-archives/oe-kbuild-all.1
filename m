Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BD31DBB3A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614927; cv=none; b=kKKUA9SGE9MgnJWcv80pdb2ortFeyqHnYTRsn8Sw333RBXBB2byLV4TqRJ8gDZlK1l+63JH9yib9Qf7mcKO+cLi6X9UW9BHia57aYQ3+H+5FKftz4wObMedr9q/DjI507TnkhpBXnGckluNvL6u3BeI/BezECad+lbk0IkJndlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614927; c=relaxed/simple;
	bh=kDSfzrC9CgbawHfYdLK7zQMe5S9Q4ouJvRrweeVGo/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYyS00Kqi69TJDZB35I0Uf32gt58XfmoZ/va6g4a3cpOWufTGXXKosOU6KdaZfV7nPLJWaZ718kmH4WGTBgnShmmf87ouR0toiAUbm27xHy0zlX4SrgffhjRTwb7YUnDD0RgoMMlSaNjWXfZ2XCon9BQ79U4UGY2J+nSB4gccy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B54B339;
	Wed,  7 May 2025 03:48:35 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 891F43F5A1;
	Wed,  7 May 2025 03:48:44 -0700 (PDT)
Date: Wed, 7 May 2025 11:48:41 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [linux-next:master 2949/6092]
 drivers/i2c/busses/i2c-xgene-slimpro.c:153:38: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <20250507-psychedelic-amethyst-weasel-af850b@sudeepholla>
References: <202505071823.iW8ueroY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505071823.iW8ueroY-lkp@intel.com>

On Wed, May 07, 2025 at 06:14:48PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   08710e696081d58163c8078e0e096be6d35c5fad
> commit: 1dde04276b4d711acdf80515dde7a166efefb1cb [2949/6092] i2c: xgene-slimpro: Simplify PCC shared memory region handling
> config: arm64-randconfig-r133-20250426 (https://download.01.org/0day-ci/archive/20250507/202505071823.iW8ueroY-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 9.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071823.iW8ueroY-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505071823.iW8ueroY-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)

I did see these before and after my changes. Though the warning itself
changes a bit with my changes, it existed before. So I didn't want to
mix up the warning fixes with this. I can take a look at them later when
I get sometime.

-- 
Regards,
Sudeep
