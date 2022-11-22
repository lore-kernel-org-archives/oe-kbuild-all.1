Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146EE1863
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Nov 2022 11:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6A0C433D6;
	Tue, 22 Nov 2022 11:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669115189;
	bh=ecLqtVgvjfaZQFm3dvrWPu2byhnXlICxad9iZZbEUVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u26fhtcCIRje3fhXCf/keptgnrHs3fQ/gJac7PF2uTX4Hclw1OyPy7Q9xVkzuSxCE
	 1/ZlzAAL2wlC8p4BqwqxjPOoY15vBgOgnVxLcilE5v9d7jYgoyVKIMdIUe5sovVybN
	 i1Zu6axr8b8ed8xo5Iqr3F0uAYBft7nOvDVnNXH/IE1bTR7oupb6sUYYru07yzgjpn
	 LrG/YonQ1YX1qDV1NQTzQbI0Poaq8myBKw9veXE9SaGb1md6LX6U1HQchNUsdrzuGK
	 YFOgqGBMJAehsf8Ozhq5eUsG8o2yxnWMLtsV7Hz4oRKl5/6nmrvqRwFmU8QUMBWcf5
	 FpMJhBGkMd/pA==
Date: Tue, 22 Nov 2022 11:06:24 +0000
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kernel test robot <lkp@intel.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 7077/9540]
 drivers/perf/arm_cspmu/arm_cspmu.c:1105:29: error: implicit declaration of
 function 'get_acpi_id_for_cpu'
Message-ID: <20221122110622.GA19690@willie-the-truck>
References: <202211221747.6AuvQi8G-lkp@intel.com>
 <20221122102839.GA19640@willie-the-truck>
 <a1f4b820-260d-69df-0d1f-5252778c3ebe@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1f4b820-260d-69df-0d1f-5252778c3ebe@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Nov 22, 2022 at 10:45:24AM +0000, Suzuki K Poulose wrote:
> On 22/11/2022 10:28, Will Deacon wrote:
> > On Tue, Nov 22, 2022 at 05:27:38PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   771a207d1ee9f38da8c0cee1412228f18b900bac
> > > commit: e37dfd65731dc4f001fa7dfa7f705e6840017d5a [7077/9540] perf: arm_cspmu: Add support for ARM CoreSight PMU driver
> > > config: loongarch-allmodconfig
> > > compiler: loongarch64-linux-gcc (GCC) 12.1.0
> > > reproduce (this is a W=1 build):
> > >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >          chmod +x ~/bin/make.cross
> > >          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e37dfd65731dc4f001fa7dfa7f705e6840017d5a
> > >          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > >          git fetch --no-tags linux-next master
> > >          git checkout e37dfd65731dc4f001fa7dfa7f705e6840017d5a
> > >          # save the config file
> > >          mkdir build_dir && cp config build_dir/.config
> > >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/iio/magnetometer/ drivers/perf/arm_cspmu/
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > 
> > > Note: the linux-next/master HEAD 771a207d1ee9f38da8c0cee1412228f18b900bac builds fine.
> > >        It may have been fixed somewhere.
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >     drivers/perf/arm_cspmu/arm_cspmu.c: In function 'arm_cspmu_get_cpus':
> > > > > drivers/perf/arm_cspmu/arm_cspmu.c:1105:29: error: implicit declaration of function 'get_acpi_id_for_cpu' [-Werror=implicit-function-declaration]
> > >      1105 |                             get_acpi_id_for_cpu(cpu)) {
> > >           |                             ^~~~~~~~~~~~~~~~~~~
> > >     cc1: some warnings being treated as errors
> > 
> > Besar, Suzuki, please can you look into this?
> 
> This was fixed with a Kconfig depenedency on ARM64 [0]. The above commit
> picked up doesn't have the fix. i.e., this is a duplicate error report.
> 
> [0] https://git.kernel.org/will/c/e72dbf9085b5

Argh, it's that one again. I clearly need more coffee, so thanks for being
patient :)

/back to sleep

Will
