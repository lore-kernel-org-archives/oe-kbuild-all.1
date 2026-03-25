Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8E83D810F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443697; cv=none; b=RD9OvQwTNvHLvQGhxJ6A/609TIByCHHlUEWju3NG5x7JVrouMBETWp2f1JRUsiGm4d2ZR6wOxVe0o4GkPkGmbmLIKKLTz2XdU2KS2qT3lkKzlkJyn+KQafI0HHsWnmsvl5HokxnD05DEDtpWNQNagGNPHaMwaTUB6JfzVRpM7o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443697; c=relaxed/simple;
	bh=nPO3lN5WTWsfoKuxsWmy+MPPgt9tZD4jTIFy1MInaF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGoxwZoWkciv+i88lUgzmWSUdSkMYllhyasIRGgeJZXcMsuC9o03VjmXTh8OKOezbu7AiGTz6HMZDHA/ZPx6cvIQI5BK5HPQoHHEnDYnF94mD/3xudZsF7OU/hmgB2LQJf3+xVXT+fitDv7Lc579ZEAVl4OsRVoufvQ4VsvVw8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePKJR/OL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePKJR/OL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD57C2BCB0;
	Wed, 25 Mar 2026 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774443697;
	bh=nPO3lN5WTWsfoKuxsWmy+MPPgt9tZD4jTIFy1MInaF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ePKJR/OLE8AIxefdyf0iS+vo0C+qhUedfGl4EY6Ti84L6e7P4NKUD/s4UtItRDsje
	 9wQwbo1FIxR6GoyOlMbSE2MowxvNOXJWHt15OwmDnPwmrlJO0Y5WlZKh9u/bizT4Ge
	 v0YKtJQ0Zyc+axPOLut11VcDb3CgAU9TEuBhBsR1sy6JtQJjssR+87YiNsEbWnkbJS
	 v9EqEXDwygxS/WgsGy+q9K8dHKzNzNAA5vaCSHKSKhzfeVp5XxbwOve+JYi8WEJEdE
	 dWG/9Clhrdrb2VCkJAdbtv/h6ZsHpzTzaVCjBEz6lb997/MB0Pav6iF6KuAUJj+/VD
	 upE3HLzILZ0fA==
Date: Wed, 25 Mar 2026 13:01:33 +0000
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [lee-mfd:for-mfd-next 23/25] drivers/mfd/ezx-pcap.c:412:25:
 error: assignment to 'struct workqueue_struct *' from 'int' makes pointer
 from integer without a cast
Message-ID: <20260325130133.GA1141718@google.com>
References: <202603251022.UUrCADAc-lkp@intel.com>
 <0dec48ed-6110-40a2-af46-7dd8bac78b7e@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0dec48ed-6110-40a2-af46-7dd8bac78b7e@kernel.org>

On Wed, 25 Mar 2026, Krzysztof Kozlowski wrote:

> On 25/03/2026 03:37, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
> > head:   a526075f56fb8f2fd96f791654ff1557e6680bde
> > commit: 356ee03f6ae7d04f90d8e2104660193c4f3a071c [23/25] mfd: ezx-pcap: Avoid rescheduling after destroying workqueue
> > config: x86_64-randconfig-161-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251022.UUrCADAc-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > smatch: v0.5.0-9004-gb810ac53
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251022.UUrCADAc-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603251022.UUrCADAc-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> 
> Did you merge the branch provided by workqueue tree? There was a clear
> dependency marked in this patchset.

I see it.  Pulled, rebased and pushed.

-- 
Lee Jones [李琼斯]
