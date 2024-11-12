Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C80320495A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 01:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731375149; cv=none; b=bs/raFNyYlZ1yxafVbqvfnfcrRykpldfWhODOwcFpPSx1n/AIszIIFD9E3aqa9f8tmOPfl1QHWRiXRCwp35qj+l6QQB5MtnaMTZX6aExZBQnV5HkzjhFnPF7m1rsBv/azyAWM9MrDYvfbC4FlEi9G5UOQGiUVfB8ilXsj/LGiYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731375149; c=relaxed/simple;
	bh=aVq0uu6RAxyyvIV/qZ+1X+k8aJ/GC57qpswexV+1pKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gML6L7L9trZtSH0l34TX600XzTfXRezIof6lm+KJIk+eUxSgaEnMnQYwnlUFKJC6R/zAZvFXqD0eS+NbA1UjSM7hSSgSDB3+7Oy0kgk3s/fdCW/K1kCr3hPCjm+YrYfGbqBlGxbRvSfV7Ix/ZWbX4+W13AAH/CFLSAN8d3SVapY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=yN4IPQDY; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="yN4IPQDY"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1731375144; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=aVq0uu6RAxyyvIV/qZ+1X+k8aJ/GC57qpswexV+1pKs=;
	b=yN4IPQDY1OqLBzvdqI2qF7iwWl8SgyHkdQwjdq0AwCNMbjlT0+sOLpAHUtRd/zfKMPr2P+Tjk0Ay3oUJ6XPyJUM9nxjZRVJOYm7iG54mCIbj2+0XoYFKfdDbWLL9vhESbH8IoJwmQMjsUGKZeQ9eHxaQ3WFwF/fzk+15bTHp/t0=
Received: from 30.178.81.245(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0WJF5qto_1731375142 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 12 Nov 2024 09:32:23 +0800
Message-ID: <b4bb6fe3-2464-4c3e-bafd-c3cf5427e83a@linux.alibaba.com>
Date: Tue, 12 Nov 2024 09:32:20 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
Subject: Re: [PATCH] nvmet: fix the error of point math issue
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-nvme@lists.infradead.org,
 oe-kbuild-all@lists.linux.dev
References: <20241111104035.31770-1-kanie@linux.alibaba.com>
 <ZzJExEvGZAXZX-Nz@kbusch-mbp.dhcp.thefacebook.com>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <ZzJExEvGZAXZX-Nz@kbusch-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2024/11/12 01:54, Keith Busch 写道:
> On Mon, Nov 11, 2024 at 06:40:35PM +0800, Guixin Liu wrote:
>> Fix the wrong place of parenthesis of ctrl_eds and data point in
>> nvmet_execute_pr_report(), switch to "void *" first and then do
>> the addtion.
> Thanks, I folded this inot the original commit.

Thanks to fold that.

Best Regards,

Guixin Liu

