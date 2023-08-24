Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D595388
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 08:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D07AC433C9;
	Thu, 24 Aug 2023 08:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692864867;
	bh=SRSONfBaD/LVoEAXKaL33y0Djjd+T5WcAY48EKiJksc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RDAE748lYPiJMQAVWZxSJoMzRQd13KAzS19bXIORO9juDvwA6TAG6OU4QuBZU/sWA
	 X5/jUVcAuoVXRcfxRxnH6Off7EyrLXJSBqbNDZ+mFsHUfIAPaez+AOeqsPFpdh7qs7
	 E8SBWWixKAS/WHGsKfpfT28kcdcaWxo2u1enHIIymqmHtGH+cRn57PIYQh1HW5Gw2h
	 IFOXx5b+fWmEUkIOy5RzFSZ6Tr2XCe8zyCglTd8JnbchMoenSfRvf04DwL2sA0rKIM
	 9jigwfj1nUv6hhYkoIZTyl88x8y8U1key8xpp/vhHHS4je9pv2f5i112yILBwEJYm9
	 5JKVAs5WuMxzg==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1qZ5U1-007aYy-0H;
	Thu, 24 Aug 2023 09:14:25 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 24 Aug 2023 09:14:24 +0100
From: Marc Zyngier <maz@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 11762/12208] drivers/perf/arm_pmuv3.c:776:
 undefined reference to `kvm_vcpu_pmu_resync_el0'
In-Reply-To: <202308240834.9JkuU1vW-lkp@intel.com>
References: <202308240834.9JkuU1vW-lkp@intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <3e5319a59f74856b2ad5db9c22e033ec@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On 2023-08-24 01:11, kernel test robot wrote:
> tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> master
> head:   e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec
> commit: b1f778a223a2a8ad6262e5233cfc3483bcf6e213 [11762/12208] KVM:
> arm64: pmu: Resync EL0 state on counter rotation
> config: arm64-randconfig-r011-20230823
> (https://download.01.org/0day-ci/archive/20230824/202308240834.9JkuU1vW-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 12.3.0
> reproduce:
> (https://download.01.org/0day-ci/archive/20230824/202308240834.9JkuU1vW-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> https://lore.kernel.org/oe-kbuild-all/202308240834.9JkuU1vW-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>    aarch64-linux-ld: Unexpected run-time procedure linkages detected!
>    aarch64-linux-ld: drivers/perf/arm_pmuv3.o: in function 
> `armv8pmu_start':
>>> drivers/perf/arm_pmuv3.c:776: undefined reference to 
>>> `kvm_vcpu_pmu_resync_el0'

This should be fixed in today's -next, which contains 9b80b9676be9
("KVM: arm64: pmu: Guard PMU emulation definitions with CONFIG_KVM").

         M.
-- 
Jazz is not dead. It just smells funny...
