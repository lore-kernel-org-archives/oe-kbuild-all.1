Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421CBAD35
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kn2B1ske"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660E1C433C7;
	Mon,  6 Nov 2023 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699261216;
	bh=mzmV/kUvsNNTyveHw/q1AZEZsm1BXGjVO0cnJmmbZBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kn2B1skeYfzHsymog73l1XXcBKDySkeTf+fkA/pWzunobHp0tCmgUfP+Cri3wixju
	 hsfNF0GtvBsdNq7iU0gIgdUwgObgmzsGaeT0iu+aGre/9zE7AY1t0IqGTPmtGqZdmq
	 2ge5jHQ81RjHpCq8fWaGMYmZTghoxwXsLZEepE20=
Date: Mon, 6 Nov 2023 10:00:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <yujie.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/comedi/drivers/tests/../ni_stc.h:1140:35: warning:
 'range_ni_E_ao_ext' defined but not used
Message-ID: <2023110641-profusely-factor-b3c5@gregkh>
References: <202311060001.aEuf1q9y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311060001.aEuf1q9y-lkp@intel.com>

On Mon, Nov 06, 2023 at 04:49:17PM +0800, kernel test robot wrote:
> Hi Greg,
> 
> kernel test robot noticed the following build warnings:
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
> commit: 8ffdff6a8cfbdc174a3a390b6f825a277b5bb895 staging: comedi: move out of staging directory
> date:   2 years, 7 months ago

Have you tested a newer kernel?  Testing a 2 1/2 year old commit feels
odd to me, was this intentional?

thanks,

greg k-h
