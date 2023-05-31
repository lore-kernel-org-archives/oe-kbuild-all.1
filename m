Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3331879
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 04:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D529CC433EF;
	Wed, 31 May 2023 04:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685505696;
	bh=fY4qHD7YQIcgg8OBxNEdeBJzECqWg8uISaDIA+xJ8tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WjTfE+TJRRDOC/Jlx7cuKLuOdbE55/x//5zvvkf8RTIQSks1vc3XBdE3hbW7dGuec
	 JVZn+Yk7nZByj3t4G1MqQYEuq2ZuO3jBnMjMMoSnDBeVBxyyQOLbDgXYtzDhJZXx3s
	 fkzceXMRg/U26MEG2l8TUaP4ggKdW3yr1Q62UW6c0h0fS+OCMlpVsy+eL0USddTO/J
	 jgS6u6EG5JBvHf9X79uEuh9tX+cZLmJ2hoz89hXwyaIuVDR3Xp9VBqd9C8BBXL1Stt
	 gUXEPJvOGhDK1lSEIzQOFKn4eTboA8SqUSpjisWBjusB/ewsuThotyeSZKg0tzzBV2
	 1+m55yGt86hPQ==
Date: Tue, 30 May 2023 22:01:33 -0600
From: Keith Busch <kbusch@kernel.org>
To: Uday Shankar <ushankar@purestorage.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, Hannes Reinecke <hare@suse.de>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [linux-nvme:nvme-6.4-rc4-pull 5/5]
 drivers/nvme/host/core.c:1202:51: error: 'struct nvme_request' has no member
 named 'start_time'
Message-ID: <ZHbGnRzo0i6KTMPg@kbusch-mbp.dhcp.thefacebook.com>
References: <202305310532.V3y3hWXI-lkp@intel.com>
 <20230531000858.GA4119628@dev-ushankar.dev.purestorage.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531000858.GA4119628@dev-ushankar.dev.purestorage.com>

On Tue, May 30, 2023 at 06:08:58PM -0600, Uday Shankar wrote:
> 
> My bad, I only tested this with CONFIG_NVME_MULTIPATH set, in which case
> the field exists and we don't see the error. The following change should
> fix this up. Keith, can you squash this with f041d3b83aea in nvme.git?

Folded in, thanks for the quick fix.
