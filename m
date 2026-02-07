Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2FF270ED2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770478443; cv=none; b=PIIzmcULdqbu7dNm3LNsQyn7dKCM6TE+dj0D8G1FzSpswy773kBvWosmYsqFTYVJvriE5CaRBH0psZNU2WjqYFKTxVGGwvfLEskGo7fl7jRHTNkNDcBKbMLSC1sUo8KL0gIzRHYBtoA3AolfMGAbcJZcX8RPwE19ZtdXxO+di2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770478443; c=relaxed/simple;
	bh=PC/PjcGJ1ZOOQv8wYmuzL71GTu2U5bxLsxqVV2/a2oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFJ39sKdqIm4THpXC7207LS7t6UeI4oJamLun4Y2FwIaOL9tX+EBUOux3wbjsysWWUfdNh21G/QcVOwZDwFuAmXTttFIF38opRqawIkq7nR6YR/S4p6vgeAVQfBuCf5VWiGF1WbugU+G7iDXWIM3jArXBlHGrPjAD48JMKXOg+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=LRaZR1gf; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="LRaZR1gf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1770478440;
	bh=PC/PjcGJ1ZOOQv8wYmuzL71GTu2U5bxLsxqVV2/a2oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRaZR1gfr2VTcvwLEFDh8ucMchmijbdPmcOf0NztVWHVJQvv1bV9M2vml535gbqXr
	 wdjmqrn8l5wNV06RXcYWOrs3unZadHAV/Xv9VXCPzfW9lpmQhYT+JBvF1bUvQI0cfs
	 +YzfXVkDdcQSUp3sh1lTJGr7jpZSTGWqNHHIr7pU=
Date: Sat, 7 Feb 2026 16:33:59 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [linux-next:master 10251/12094] drivers/hwmon/cros_ec_hwmon.o:
 error: objtool: cros_ec_hwmon_read+0x6c: can't find jump dest instruction at
 .text+0xd2d
Message-ID: <317af5ed-fc8b-42d7-aa4a-143f8cf3ab04@t-8ch.de>
References: <202602071311.Q6tATiyh-lkp@intel.com>
 <4db66fc2-dc8a-4499-bc9d-c1f85e2ba4c1@t-8ch.de>
 <957068ee-7368-4fd1-9e55-1449414238be@roeck-us.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <957068ee-7368-4fd1-9e55-1449414238be@roeck-us.net>

On 2026-02-07 07:07:13-0800, Guenter Roeck wrote:
> On 2/7/26 02:56, Thomas Weißschuh wrote:
> > On 2026-02-07 13:14:53+0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   9845cf73f7db6094c0d8419d6adb848028f4a921
> > > commit: 165c14597d53cfa7bc97b4ff8bc85f7bd98262b7 [10251/12094] hwmon: (cros_ec) Add support for temperature thresholds
> > > config: x86_64-randconfig-071-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071311.Q6tATiyh-lkp@intel.com/config)
> > > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071311.Q6tATiyh-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202602071311.Q6tATiyh-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > > > drivers/hwmon/cros_ec_hwmon.o: error: objtool: cros_ec_hwmon_read+0x6c: can't find jump dest instruction at .text+0xd2d
> > 
> > This is due to the call to unreachable() in cros_ec_hwmon_attr_to_thres().
> > Replacing it with BUG() avoids the issue.
> > 
> > Guenter, do you want to drop the patches for now and I'll resend them
> > next cycle? I can also send an incremental patch. Or you just fix it up
> > in your branch.
> > 
> 
> I strongly dislike BUG() because it means "I don't trust my own code".

Agreed, I am not a fan either, which is why I used unreachable()
originally.

> The final "else" in the code is not really necessary and should be dropped.

That will trigger a compiler warning:

drivers/hwmon/cros_ec_hwmon.c:170:1: error: control reaches end of non-void function [-Werror=return-type]
  170 | }
      | ^

> I can do that if you like, but I won't introduce BUG().

Another alternative would be to use __builtin_trap(),
but that feels too low-level for driver code.

Or we return a dummy value, knowing that it will never actually happen.

I'm a open for other suggestions.

Weirdly enough the objtool warning only seems to happen on GCC 14.2,
my system GCC 15.2 is not affected. Not that it will make a difference
in practice.


Thomas
