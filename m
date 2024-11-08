Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66F5DDA8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 07:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731049848; cv=none; b=jJLcbVHQxZg4PsE5xuV2iBRccRg3DW8gcx8l/bWQ0iqZSAvM6+UyadPpklLTJ3tkKUwa4nPd5zhG1osWOZMexA+rSa4ObzPHaZ2tHIUrzNjzJpn4u1SQB24WXK/EZ1Iox9KfFWyzhPFIG0237VCikI7mdkmDItrR1sff+Jlj6FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731049848; c=relaxed/simple;
	bh=NrSn01O7zVzIegbTYXDgYZi+xE+AVBPXymKhqxLJ6Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+yafI5ZSJ3xh+ay9kTHit28oo36sZBXnkBoPukwwzjVxBxnQugxA0oTEhrIavlIJ5CMsO0Q2ndKLo1hg8IQT5j/ghef2sU6Dzgqg8u0ks06NMZYNpDbB1cUm10pqAzQyR7kwDJLqFPH7/1jXYbNZ7lg0mBNLkIN2meVJzfwMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A94E568B05; Fri,  8 Nov 2024 08:10:43 +0100 (CET)
Date: Fri, 8 Nov 2024 08:10:43 +0100
From: Christoph Hellwig <hch@lst.de>
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: kernel test robot <lkp@intel.com>, Keith Busch <kbusch@kernel.org>,
	oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Dmitry Bogdanov <d.bogdanov@yadro.com>,
	Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>
Subject: Re: [linux-nvme:nvme-6.13 7/7] drivers/nvme/target/pr.c:857:34:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <20241108071043.GA9339@lst.de>
References: <202411081109.soCWJfGT-lkp@intel.com> <c44c4ea6-ef4d-4152-ba21-9a76011dd75e@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c44c4ea6-ef4d-4152-ba21-9a76011dd75e@linux.alibaba.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Nov 08, 2024 at 11:29:35AM +0800, Guixin Liu wrote:
>     I miss here should use cpu_to_le16, should I send a v20 to fix this?
>
> Best Regards,

Just send an incremental fix that can be folded in.

