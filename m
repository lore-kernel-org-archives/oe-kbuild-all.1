Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E6963C4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 May 2023 14:10:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 511606E3;
	Sat, 20 May 2023 14:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 511606E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1684591822; bh=dYPEbsoFSogWxKQxoDqagJpLehE7QWnixRnd3wO8y2A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g9dri15sHzP6EQkgVPD3v3FpECit0mhNvhbzXpfRLlXpWZxlygq7tH39VFjCyLrFO
	 8N6ND0ir05dv4qVj4hfci37a6ZfkA1j8HZt6i1EYoV8hwCmZVZyfuyDPpe5itlt508
	 X8VPU6nUBFxBDAuSJfTLLjS+qYY0XVvWqWj+/ZOz9mQrfiP8pc+oBXnaInwhU7OKzU
	 1OkXSevwAXo6eNabZHH+sMKjM86CF9g5mtlLt2afCq1Zj3AujRncvg+51nckesBeqq
	 2+Wc8ZLhKPvfO7V26v6r9iRwBXFfAhLTD4c2Y1Gn4unP5MlUiRlhviQCic9oiGGuRI
	 t43wakMqZE+lg==
From: Jonathan Corbet <corbet@lwn.net>
To: kernel test robot <lkp@intel.com>, Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>
Subject: Re: [lwn:docs-next 12/12] htmldocs: Warning:
 Documentation/process/2.Process.rst references a file that doesn't exist:
 Documentation/process/submittingpatches.rst
In-Reply-To: <202305201652.POM84URe-lkp@intel.com>
References: <202305201652.POM84URe-lkp@intel.com>
Date: Sat, 20 May 2023 08:10:20 -0600
Message-ID: <87v8gnjdpv.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:

> tree:   git://git.lwn.net/linux.git docs-next
> head:   329ac9af902e441bae13803a4d7126aaf5984188
> commit: 329ac9af902e441bae13803a4d7126aaf5984188 [12/12] docs: submitting-patches: Discuss interleaved replies
> reproduce:
>         git remote add lwn git://git.lwn.net/linux.git
>         git fetch --no-tags lwn docs-next
>         git checkout 329ac9af902e441bae13803a4d7126aaf5984188
>         make menuconfig
>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
>         make htmldocs
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305201652.POM84URe-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> Warning: Documentation/process/2.Process.rst references a file that doesn't exist: Documentation/process/submittingpatches.rst

Oops...I need to figure out why I didn't notice that.  I've dropped the
following in to make this go away.

Thanks,

jon

From a1d2c9b3029de24505c09430931966b96fe1b678 Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Sat, 20 May 2023 08:07:04 -0600
Subject: [PATCH] docs: process: fix a typoed cross-reference

Commit 329ac9af902e added a cross-reference missing a hyphen; add one from
my emergency hyphen stash.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 329ac9af902e ("docs: submitting-patches: Discuss interleaved replies")
Closes: https://lore.kernel.org/oe-kbuild-all/202305201652.POM84URe-lkp@intel.com/
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/process/2.Process.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
index 9ab58a0d4fac..613a01da4717 100644
--- a/Documentation/process/2.Process.rst
+++ b/Documentation/process/2.Process.rst
@@ -437,7 +437,7 @@ There are a few hints which can help with linux-kernel survival:
 - Use interleaved ("inline") replies, which makes your response easier to
   read. (i.e. avoid top-posting -- the practice of putting your answer above
   the quoted text you are responding to.) For more details, see
-  :ref:`Documentation/process/submittingpatches.rst <interleaved_replies>`.
+  :ref:`Documentation/process/submitting-patches.rst <interleaved_replies>`.
 
 - Ask on the correct mailing list.  Linux-kernel may be the general meeting
   point, but it is not the best place to find developers from all
-- 
2.40.1

