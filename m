Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E4F6F06B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 11:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731324949; cv=none; b=OK8dV0TwWD/C+IRUo1UOp+19NwKyB2V6Njx65qnD2XktOUEZ4F3lbslYenuOCzaMIFEef8wQdP4UaavtmcNOR6T/yJNmEm519DLLZlCDF2cYVUivFPu2yNo5eqx6gU/+gGz+76nqlT9jTP9UfXYQKaHiXW7OG1UhGqGMah2wIyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731324949; c=relaxed/simple;
	bh=w1xipc7gSmhwuU6Zd2QbPLZh9gkKSihZgyj5wm28sMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LalrcvelKydI3Pls2XCHfg+e2B32kL4L9Knqi99LIQrZ+RDBq7gJGRN95BssKINv/aGmUbLr5kyOCXwmrdZRJ/O62G+IxfzobtTYpFnCwrQ06Uarmi96ut+Z3GeJxwRvYOnWDLzD9CCtMwOzAcfZ8WZhvwKNZ/t7HZ1WjkfrkTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0F72368D07; Mon, 11 Nov 2024 12:35:43 +0100 (CET)
Date: Mon, 11 Nov 2024 12:35:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Guixin Liu <kanie@linux.alibaba.com>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] nvmet: fix the error of point math issue
Message-ID: <20241111113542.GA30234@lst.de>
References: <20241111104035.31770-1-kanie@linux.alibaba.com> <f4ce4ae4-fb33-467b-937c-444a46eb6f02@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4ce4ae4-fb33-467b-937c-444a46eb6f02@stanley.mountain>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Nov 11, 2024 at 01:48:57PM +0300, Dan Carpenter wrote:
> On Mon, Nov 11, 2024 at 06:40:35PM +0800, Guixin Liu wrote:
> > Fix the wrong place of parenthesis of ctrl_eds and data point in
> > nvmet_execute_pr_report(), switch to "void *" first and then do
> > the addtion.
> > 
> > Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
> 
> This needs a Fixes tag so that the stable tools know not to apply it to old
> kernels.

We might still be able to fold it in as it's near the top of the
nvme tree not send upstream yet.
