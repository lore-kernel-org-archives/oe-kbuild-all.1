Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B885D30D3F6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172426; cv=none; b=cAhSKmDecuJUz+XeRdxER0AWqscuex1k7idobtud/ye+tZH9FIR/oLQgBVAWDlNZI+QhHyGwteoyI/Exy6npG4W7UcVqy9t6Pf08sZp6YJ8w/aSD0mXjayBJtbd2tPDzHU0Noog3bZF5oUg+2wycDriCxZE73cfa+UErrxu5qKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172426; c=relaxed/simple;
	bh=/JgeMhi06GVbvpfsrq7AjkAs7zAws+cyVKPnDn4T9fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljAKzomDdHaGCqrdtiB9R88GVfEwRr2psyih27i34kTL3l4grOec8EuXNO2ZTmB+F3GUbXV68yJj2w4/awuXvjEF796/Hf/+lewK5Y1mC80Hvc9w2kcQGWdmr7yM0vdo80gTyBcyp5d19ZRSWlAJjiHE4/x1dKFsUHw3kH8LBOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtoRpyw8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtoRpyw8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8B71F00898;
	Thu, 11 Jun 2026 10:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781172425;
	bh=3bTLPvs2Idsb+E798dSjJro/3/aXWkTYhTgPKJ+3EjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DtoRpyw8BPe/6chcJNqN9N0MIElMF9Ypv4FcIFlwK4iD0MPfPYOw7ruoAKxmwJL0c
	 c+3YaFo0Jnq/pk0N/oGE6iCnEJe15ndAr3MSMbMcpa3ARFbicJXFEZR5zRbzGBNuLM
	 ii94DLxmOmzZB2BcPK+FAQ7pRViUNv7LpzjF/i3C9//dKguNkWH2GbyFi0XF4ShMOE
	 ZMKqaEhUZ6Jgksuf/MtyfwQIrdoGVDRPzLWeMTnDrnj0HrFfmz4rZ7OvacXlpxxPUy
	 iZjJQa8EyvUfpXm+S83taRdpV5C5HS98Wtb6hVvLYYZ9dKYo6VqdOdEjg3/uIS8kIk
	 1RUhhh/PTp4Ww==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wXcJT-00000001e5r-0QY5;
	Thu, 11 Jun 2026 12:07:03 +0200
Date: Thu, 11 Jun 2026 12:07:03 +0200
From: Johan Hovold <johan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulfh@kernel.org>
Subject: Re: [ulfh-pm:next 12/12] drivers/pmdomain/core.c:36:23: warning:
 'genpd_provider_bus' defined but not used
Message-ID: <aiqIx_ayahpHI_oF@hovoldconsulting.com>
References: <202606111746.kAxaAbwg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202606111746.kAxaAbwg-lkp@intel.com>

On Thu, Jun 11, 2026 at 05:36:21PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git next
> head:   ea1ca762328194de780a8e92df0b2e41bf6eeed2
> commit: ea1ca762328194de780a8e92df0b2e41bf6eeed2 [12/12] pmdomain: fix early domain registration
> config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260611/202606111746.kAxaAbwg-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111746.kAxaAbwg-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606111746.kAxaAbwg-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/pmdomain/core.c:36:23: warning: 'genpd_provider_bus' defined but not used [-Wunused-variable]
>       36 | static struct device *genpd_provider_bus;
>          |                       ^~~~~~~~~~~~~~~~~~

Bah. Apparently the only users of the bus are under
CONFIG_PM_GENERIC_DOMAINS_OF so this one either needs to be marked
__maybe_unsed or be moved inside the ifdef.

I'll send a follow-up fix.

Johan
