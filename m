Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8C8298241
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Jul 2025 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963250; cv=none; b=noEmtZpKTNR2A5dd/9LyhEy5y7eaoFI6JZyLn97OQCDIV2uFx3FSveAcSupIWreIiiXP4Ou6RwaGqwrZqvApTzlT+hZIWhaBIHi4MbFvwkYyrAjdD4h0a3YD6ymLNbIItICenG91ZVR0N/EtbhmCjuBuctHGSI5QBZIfvNncvgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963250; c=relaxed/simple;
	bh=kk/ucFvuE7NlWt2CF0R+kv4Ed+8XSzirezUjJBU6qQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWVq2Um7NiYKXYmxz2ulUc9ACdmHfj09u4oVQ3/GD6a9dp3XFqoewiEChXr7TTs9VVMjzwV+9rXN/NOPmuGLrIHKA0qu5RbrJ6przoxzonctDgn22orOoMoC9mduVil2o/CEdTXbVyUAbV7i0tC1PQrmibquKcNJDiGKZ/vMPqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E74A1595;
	Tue,  8 Jul 2025 01:27:15 -0700 (PDT)
Received: from bogus (unknown [10.57.50.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08F6D3F694;
	Tue,  8 Jul 2025 01:27:25 -0700 (PDT)
Date: Tue, 8 Jul 2025 09:27:16 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: kernel test robot <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [sudeep-holla:for-next/scmi/updates 5/6]
 drivers/firmware/arm_scmi/bus.c:349:33: error: 'scmi_pm_suspend' undeclared
 here (not in a function)
Message-ID: <20250708-intelligent-certain-beaver-61219d@sudeepholla>
References: <202507072359.Hfy79Adu-lkp@intel.com>
 <PAXPR04MB845932CD9E1C87FA1A4F72BC884EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB84595E0F0BDB6BDE444D3D00884EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84595E0F0BDB6BDE444D3D00884EA@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Tue, Jul 08, 2025 at 01:57:26AM +0000, Peng Fan wrote:
> > drivers/firmware/arm_scmi/bus.c:349:33: error: 'scmi_pm_suspend'
> > undeclared here (not in a function)
> > 
> > > drivers/firmware/arm_scmi/bus.c:349:33: error: 'scmi_pm_suspend'
> > > undeclared here (not in a function)
> 
> Seems there is a force push in the branch, I not able to find the
> commit f9a301ca0e82d0bb923cddde667c4a035b8a23e9
> 
> Latest branch, per my test, not able to reproduce the issue.
> 

Ignore this, I had missed a change and bots picked up the branch before
I corrected it with local testing.

-- 
Regards,
Sudeep
