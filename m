Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B37D1A704C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 17:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731347655; cv=none; b=nOihukQhbRgSNHLrsvtp/S2p6dyKxZDjHRoR7nkEUwXByd3+6kLrSPXztHYooUsySupeOCXQqPz9nmMXc4QKIvkLQ9UcEu9pqeKNVn2Gdm//mPxyJNbOb2hk3vWl2sbIPfUXz577ahTc/C1a9oLU9D2a0b+FeBj3cIG4fWOuxbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731347655; c=relaxed/simple;
	bh=XKovk5n+lw1EjJJ9aZqtHAy2zHHXYa1QaZkQKgY7Nc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocOV6L7N+5K2Lj5GcwG0wy5eAE/a0JSM/fx+XGvWq7S2DmeA1MQ1NizQvqznpNPhc2jz/OiE56/mankNeAkD7bGJhPkTdn45RvNqKNkpUKXy4LWarwSW+jH1nkRUXb/uB1Le8/iq8GEQgD7jATF1HqAtrv0sWxiVsS5205YMEiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AL1l0WQZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AL1l0WQZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B60C4CECF;
	Mon, 11 Nov 2024 17:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731347655;
	bh=XKovk5n+lw1EjJJ9aZqtHAy2zHHXYa1QaZkQKgY7Nc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AL1l0WQZ0RbhxQAH2edEigoDIORyZ5BKWGbJHDMQCp2ALoFO34uiYazemzerlZGbz
	 b0NhgXUXknVcqpEk1Hek/WoDXqSblY54yNsRILXFYQ5yN3MjLAQNQia0FqvsNzy0XU
	 oUTAw9caWuw6fl9KF1FCqHMfMbK3qtAceY8BM586Gl5RZoaKnuUa6QbwxDMdVk7Ds0
	 QPjx2S8lwkPF6JGhlu+WhZ2NSYvjqkkbNstBHzPeo9MU1XzWx3j/xEv2kPHbFFdElM
	 I6CZcyQFcVd+O423kuh5N8qgp47b/kvHx6+igqc20YHTT0vNMy5EConOCu7jFrLsa6
	 7X23reVc85S4w==
Date: Mon, 11 Nov 2024 10:54:12 -0700
From: Keith Busch <kbusch@kernel.org>
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-nvme@lists.infradead.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] nvmet: fix the error of point math issue
Message-ID: <ZzJExEvGZAXZX-Nz@kbusch-mbp.dhcp.thefacebook.com>
References: <20241111104035.31770-1-kanie@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111104035.31770-1-kanie@linux.alibaba.com>

On Mon, Nov 11, 2024 at 06:40:35PM +0800, Guixin Liu wrote:
> Fix the wrong place of parenthesis of ctrl_eds and data point in
> nvmet_execute_pr_report(), switch to "void *" first and then do
> the addtion.

Thanks, I folded this inot the original commit.
