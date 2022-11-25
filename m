Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5465F5CBE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Nov 2022 18:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACBDC433D6;
	Fri, 25 Nov 2022 18:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669400224;
	bh=H4hIc3u/3viiMs7hAwqnnqI06dB+Y9jh7P1ZTPHF0Xw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZcrlCN7HntNcLK3dNPqFM+WXJc89f25j6tCMdigrI5l2JxiAR/duRckpKJMIS7utX
	 64ebI5XL2DmGlxzVPPZAKhI4LYaK4AFgoK+MNJaDpmqj6YMdzUNJw9eG1ckn+ZKdbY
	 CVTBpRFMlYJQAdt/2oDH2jDis6s2L1XQeMv/CQmh0r5s+U2gBkBsucO+XpOvCsZhHV
	 X6oJrZ9eatq2Dtxbxd6mmHNNiiMiuilrQ3h9fpH8jdVUN6+vLZc5mBFbcvBd2/re5m
	 VYtszJJ2E9s6C2DP1niiYrRx9ujH8N9U6VAvVuk7zoFsb3+NNibFtogkv0N12SqPO3
	 y5cvYXGCjTIOA==
Message-ID: <871bacc9-6c0b-9841-107e-da60a2c8e01e@kernel.org>
Date: Fri, 25 Nov 2022 19:16:56 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] Documentation/osnoise: escape underscore of NO_ prefix
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
 kernel test robot <lkp@intel.com>
References: <202211240447.HxRNftE5-lkp@intel.com>
 <20221125034300.24168-1-bagasdotme@gmail.com>
From: Daniel Bristot de Oliveira <bristot@kernel.org>
In-Reply-To: <20221125034300.24168-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/22 04:43, Bagas Sanjaya wrote:
> kernel test robot reported unknown target name warning:
> 
> Documentation/trace/osnoise-tracer.rst:112: WARNING: Unknown target name: "no".
> 
> The warning causes NO_ prefix to be rendered as link text instead, which
> points to non-existent link target.
> 
> Escape the prefix underscore to fix the warning.
> 
> Link: https://lore.kernel.org/linux-doc/202211240447.HxRNftE5-lkp@intel.com/
> Fixes: 67543cd6b8eee5 ("Documentation/osnoise: Add osnoise/options documentation")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Acked-by: Daniel Bristot de Oliveira <bristot@kernel.org>

Thanks!
-- Daniel
