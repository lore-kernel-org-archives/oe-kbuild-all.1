Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF91931B807
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 17:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761327829; cv=none; b=gg5E0Z2S0WfaBEYlL3incvrMaqlrp/Fja++VNsAQrt9Pfz8frmRO8W9ykWWoiR0zxsMYlAnbiCaSiY9JKf0+MTn+TwdypQg8+5IKPcIdJgl4Oe6sWUNUZDyGkIAu53Bq8DXbPha6nkc2n/q2sOJX+R40nbmQ9YOEdbXOJbLdg6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761327829; c=relaxed/simple;
	bh=LgFukOtQTPGGHIyAFL4lEUVQQkSEGl2WwAap5Av3gaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6n33JNsVn5yNm8Lyy8rCYNG8yBjaXKoQuZ06RwYuS1sV4h3OUMxohSEauwS9N7I26u23Rhu8EIHVxKZh5Qe4ZCcerJe62zRZ6gcs/4G5kpOV9eb1dv+b3VEMi5EnZFUVZzmslq4ztB503g7169kAx34GpG42rMbambPmd3LrtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B675175A;
	Fri, 24 Oct 2025 10:43:39 -0700 (PDT)
Received: from [10.122.4.147] (unknown [10.122.4.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 468093F63F;
	Fri, 24 Oct 2025 10:43:47 -0700 (PDT)
Message-ID: <e1d1ffc0-dda5-4501-8bd5-e4e7ea667f10@arm.com>
Date: Fri, 24 Oct 2025 12:43:45 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Warning: drivers/char/tpm/tpm_crb.c:193 function parameter 'loc'
 not described in '__crb_go_idle'
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202510241542.hFrped3X-lkp@intel.com>
Content-Language: en-US
From: Stuart Yoder <stuart.yoder@arm.com>
In-Reply-To: <202510241542.hFrped3X-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jarkko,

I have sent a v2 of this patch that adds the missing kernel
doc info that triggered this warning.

Thanks,
Stuart

On 10/24/25 9:17 AM, kernel test robot wrote:

On 10/24/25 9:17 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
> commit: dbfdaeb381a49a7bc753d18e2876bc56a15e01cc tpm_crb: Add idle support for the Arm FF-A start method
> date:   6 days ago
> config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20251024/202510241542.hFrped3X-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510241542.hFrped3X-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510241542.hFrped3X-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Warning: drivers/char/tpm/tpm_crb.c:193 function parameter 'loc' not described in '__crb_go_idle'
>>> Warning: drivers/char/tpm/tpm_crb.c:246 function parameter 'loc' not described in '__crb_cmd_ready'
> 

