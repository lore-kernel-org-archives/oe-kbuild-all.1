Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF7F1C03
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Nov 2022 12:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94CB1C43149;
	Wed, 23 Nov 2022 12:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669207815;
	bh=KIU5zp/fHoYcSmyOn6tMxUQbgOWXMmNWP4dKrv8hHw8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AroRLCvktahdpG9E/1xzAbX+pLCQ4UWcDM68y5Vl2CRKd6SU0zfgyCiMDUkfqlxmM
	 9DqStZMZplgx8TkXm+QTurTBPJ9Kxa/JS/+cUcpWgTXfa2xpl0vZrJ/vZXbD6TtLPd
	 mj/sMk/RV9HQaZYm3GN9H5uobHiKnMDbTxuPv9dDcML/Vznqxnh1uvJ9VvrXkXsnP7
	 n9tw9DID2HmpnJQA4Kbh5Jh5rqyB5/510BSaBgwVKiLt30t0H+nKp+kX6fIDDZdOns
	 Qs7cxYWGMqi2Xja27yf2vk6tkrMRRoqGHFqCCrllx2S1yMbhiY12ZhDQp/iBQNKh64
	 4l9tFVjCTnCWw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F6EDE21EF9;
	Wed, 23 Nov 2022 12:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] Documentation: devlink: Add blank line padding on
 numbered lists in Devlink Port documentation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <166920781551.7047.17657573305612000567.git-patchwork-notify@kernel.org>
Date: Wed, 23 Nov 2022 12:50:15 +0000
References: <20221121035854.28411-1-bagasdotme@gmail.com>
In-Reply-To: <20221121035854.28411-1-bagasdotme@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 gwml@vger.gnuweeb.org, lkp@intel.com, jiri@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net,
 michal.wilczynski@intel.com, ammarfaizi2@gnuweeb.org

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Mon, 21 Nov 2022 10:58:55 +0700 you wrote:
> kernel test robot reported indentation warnings:
> 
> Documentation/networking/devlink/devlink-port.rst:220: WARNING: Unexpected indentation.
> Documentation/networking/devlink/devlink-port.rst:222: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> These warnings cause lists (arbitration flow for which the warnings blame to
> and 3-step subfunction setup) to be rendered inline instead. Also, for the
> former list, automatic list numbering is messed up.
> 
> [...]

Here is the summary with links:
  - [net-next] Documentation: devlink: Add blank line padding on numbered lists in Devlink Port documentation
    https://git.kernel.org/netdev/net-next/c/c84f6f6c2bb5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


