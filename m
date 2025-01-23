Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F0F20B7F0;
	Thu, 23 Jan 2025 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737618278; cv=none; b=TgO1I7qzwzfqYZd4loP5/dw9pKsWM3dD/AIFO6t4DfrDA/xfnjhTc7oWy7dTI+QB1E6M6JDUhuGtIpTQmvF6IY1fcExFtysv1GqyFQ2oVCE4DBs8FUu3cFVEwnagp8jE416tGDW74UO2UNUwtHFpMNFz0NQIchEYZgxpOAOaN0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737618278; c=relaxed/simple;
	bh=ZZalJcNdYEu+B5B2jQ5zFe3nPUKmm3vz1sYjPlJ5/R0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTJa/srZ7rysqVkpIqGSkOXe6YSbLgeMZ6YA/+vmBkljHCIAIOd5nwwsk4nk1LDkrhop13A448z4z2oMoqkRt3hA4x82oLBOiS59L81ahr6DZ7jbLwo1G0+16Pe8nQsH9wwFQorbxXxdsPHKEJBlnMrbLRlXyzQSSPpeTB9Bmpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LHJvea4s; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LHJvea4s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ibn2RyewmOxU+1YqJgXQvfU96KdDM5Oay+ukrmvALaE=; b=LHJvea4sR9t52Bl7owYJPc1u9u
	m9Iu3RkDsBgfYhHG3MFXQbNDowI+7D0dFKl0G5FqX4a/gcpx1lMD1FZLYHmKn0LBvwYtx6NqP0Jqr
	U/zGe+pmIJzyrnQNtDNfvcyhk+h8rjoGY+2wEaQfKM0iTFzWa5+mdj4zkmLMXxW240pwTlNMmT5Il
	Ow+50KbdZhBiZgJqKQFc4Nf/7wR5gCloLdVXLWSJMXHk1HgQ8hRt6AdWoGzm23Cq+hmzNMIPFb9Ok
	7iC9SEH3Av17140U+ObefiDWeom0pYdKfsz9vth2avpf+75m3vdPrLgWcZjP1lgZQWwgT7bfKSjOD
	55yOSuoA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tart6-0000000DkdE-0Ijx;
	Thu, 23 Jan 2025 07:44:29 +0000
Message-ID: <46151c97-9f2e-407d-a9b7-fec1034281fb@infradead.org>
Date: Wed, 22 Jan 2025 23:44:21 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/base/power/runtime.c:362: warning: Excess function
 parameter 'dev' description in '__rpm_callback'
To: kernel test robot <lkp@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202501231452.84vwjQqo-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202501231452.84vwjQqo-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi robot,

On 1/22/25 10:59 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   21266b8df5224c4f677acf9f353eecc9094731f0
> commit: 7be6a87c2473957090995b7eb541e31d57a2c801 sparc: allow PM configs for sparc32 COMPILE_TEST

^^^ Not relevant.

> date:   1 year, 11 months ago
> config: sparc-randconfig-r032-20230416 (https://download.01.org/0day-ci/archive/20250123/202501231452.84vwjQqo-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231452.84vwjQqo-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501231452.84vwjQqo-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/base/power/runtime.c:362: warning: Excess function parameter 'dev' description in '__rpm_callback'
> 
> 
> vim +362 drivers/base/power/runtime.c
> 
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  354  
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  355  /**
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  356   * __rpm_callback - Run a given runtime PM callback for a given device.
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  357   * @cb: Runtime PM callback to run.
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  358   * @dev: Device to run the callback for.
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  359   */
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  360  static int __rpm_callback(int (*cb)(struct device *), struct device *dev)
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  361  	__releases(&dev->power.lock) __acquires(&dev->power.lock)

The kernel-doc warning is a bug in scripts/kernel-doc.

I don't know of anyone who is working on that bug.

The only fix that I know of for now is to change the /** to plain /* to that the
comment is not considered as kernel-doc notation. That should be OK since this is
a static function, not exported.


> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27 @362  {
> 63d00be69348fd Ulf Hansson       2021-06-08  363  	int retval = 0, idx;
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  364  	bool use_links = dev->power.links_count > 0;
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  365  
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  366  	if (dev->power.irq_safe) {
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  367  		spin_unlock(&dev->power.lock);
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  368  	} else {
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  369  		spin_unlock_irq(&dev->power.lock);
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  370  
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  371  		/*
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  372  		 * Resume suppliers if necessary.
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  373  		 *
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  374  		 * The device's runtime PM status cannot change until this
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  375  		 * routine returns, so it is safe to read the status outside of
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  376  		 * the lock.
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  377  		 */
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  378  		if (use_links && dev->power.runtime_status == RPM_RESUMING) {
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  379  			idx = device_links_read_lock();
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  380  
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  381  			retval = rpm_get_suppliers(dev);
> 5244f5e2d80125 Rafael J. Wysocki 2021-03-19  382  			if (retval) {
> 5244f5e2d80125 Rafael J. Wysocki 2021-03-19  383  				rpm_put_suppliers(dev);
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  384  				goto fail;
> 5244f5e2d80125 Rafael J. Wysocki 2021-03-19  385  			}
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  386  
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  387  			device_links_read_unlock(idx);
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  388  		}
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  389  	}
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  390  
> 63d00be69348fd Ulf Hansson       2021-06-08  391  	if (cb)
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  392  		retval = cb(dev);
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  393  
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  394  	if (dev->power.irq_safe) {
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  395  		spin_lock(&dev->power.lock);
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  396  	} else {
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  397  		/*
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  398  		 * If the device is suspending and the callback has returned
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  399  		 * success, drop the usage counters of the suppliers that have
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  400  		 * been reference counted on its resume.
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  401  		 *
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  402  		 * Do that if resume fails too.
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  403  		 */
> dbfa44782787dc Rafael J. Wysocki 2022-12-05  404  		if (use_links &&
> dbfa44782787dc Rafael J. Wysocki 2022-12-05  405  		    ((dev->power.runtime_status == RPM_SUSPENDING && !retval) ||
> dbfa44782787dc Rafael J. Wysocki 2022-12-05  406  		    (dev->power.runtime_status == RPM_RESUMING && retval))) {
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  407  			idx = device_links_read_lock();
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  408  
> 5244f5e2d80125 Rafael J. Wysocki 2021-03-19  409  			__rpm_put_suppliers(dev, false);
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  410  
> 5244f5e2d80125 Rafael J. Wysocki 2021-03-19  411  fail:
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  412  			device_links_read_unlock(idx);
> 0cab893f409c53 Rafael J. Wysocki 2021-03-19  413  		}
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  414  
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  415  		spin_lock_irq(&dev->power.lock);
> 21d5c57b372616 Rafael J. Wysocki 2016-10-30  416  	}
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  417  
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  418  	return retval;
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  419  }
> ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  420  
> 
> :::::: The code at line 362 was first introduced by commit
> :::::: ad3c36a534bc7b945d7bffdda1c62e13bf93489a PM / Runtime: Don't run callbacks under lock for power.irq_safe set
> 
> :::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
> :::::: CC: Rafael J. Wysocki <rjw@sisk.pl>

So why is this email not sent to Rafael?
I added his email address.

Thanks so much!
-- 
~Randy

