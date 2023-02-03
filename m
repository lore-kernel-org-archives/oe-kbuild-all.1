Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914EC4C60
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 12:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57722C433AA;
	Fri,  3 Feb 2023 12:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675428071;
	bh=qaqWYAE2ZvxLSui+6rGk8OIk87GX3IxUvAkpI2UQ94Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K2IvEGBcS3gcQ7/6+gL8EfDv7GIF2TZ16JVTfJ9CNcpXuR0mDDGy8FbebCIy9KN98
	 je+Gvc9RQJpChdlxsHBwBAoIi2SXjXH39lu17nKypSHJnGMjwHDN5cXNBrbi7JztHL
	 ZMvAqHtVRzle1KhLS+2rbFg8ETXVM+Z3yD88u8pEcow4pVXETSxW47ZNxY+wS2BlNS
	 oHkBkKOiWLAMCc0i8cB0TF8XTY7NGq86Ou3whm5squUMPdcBp2jwLmIBLrmYdahiFu
	 sEFHkCN5l8yZG/3Jp/kn34cPKC3YubwZcIGaLmi79CWH66kGqNuAv8vTPZ5/P80vo2
	 nEhOUhY0VOEGg==
Message-ID: <4aa8353b-a7f2-20b3-ed16-bfe5b340d7dd@kernel.org>
Date: Fri, 3 Feb 2023 13:41:05 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [linux-stable-rc:queue/4.19 1/66]
 drivers/memory/atmel-sdramc.c:62:23: error: implicit declaration of function
 'devm_clk_get_enabled'
Content-Language: en-US
To: cuigaosheng <cuigaosheng1@huawei.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>
References: <202302012152.IA9WllvH-lkp@intel.com>
 <010464e4-e8a6-0c23-715e-8aef45c30d26@huawei.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <010464e4-e8a6-0c23-715e-8aef45c30d26@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/02/2023 04:48, cuigaosheng wrote:
> Thanks for reporting the issue, this patch depends on the following patches:
>    7ef9651e9792 clk: Provide new devm_clk helpers for prepared and enabled clocks
>    abae8e57e49a clk: generalize devm_clk_get() a bit
> we can fix the issue by applying them, thanks for Sasha's work again!
> 

Or just drop the backports.

Best regards,
Krzysztof

