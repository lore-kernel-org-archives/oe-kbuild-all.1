Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D041B199FBA;
	Sat,  6 Dec 2025 13:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765027171; cv=none; b=aucCXIEXPZ/EqFnnhibkgDJcfwDJEKOBnWuSxi0m3zfqXw/GH2URL36q22fRnZw158PWMrK+5bJp6S/FWjn74aqvk5JpwyARUHiaNFVe9gwlVyV4aw25NFQ9FGjm/lDOeJ7LxCHVYG5tEdoUronwzU2mfMY7v1fA0spjrmJoymM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765027171; c=relaxed/simple;
	bh=18yUxHpOkie+CTnEIKGVhIe9m9RepnZZoFKEVsFqjjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VRjL5G8Nq/Peu6PpQ4fnL3BwdaudIm9T/EiEeGegBBnVgzv9bqBF4F8h9k+G7z0noY83mm2dU9r7FyDKLVzZw/C5/V1rN1AYnD2+y6RdR7FORTzX++ueA033GDcC5hVbmulYbj6Oy2SHCoB41Phc6ZjucML+2WNvSdH6Fv1Fn5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+JySupA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+JySupA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE1AC4CEF5;
	Sat,  6 Dec 2025 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765027171;
	bh=18yUxHpOkie+CTnEIKGVhIe9m9RepnZZoFKEVsFqjjA=;
	h=From:Date:Subject:To:Cc:From;
	b=Q+JySupAZ4A9OptHDm0jDDi/431EK/3K3pBIZfUrWD8k0mhc2MKVjggoxUtcByhlk
	 JNygebB/yFetXq3epTzIVAwuMvhc/8AXAFnBya72XY4gMQ74g8sJjE5Pnup5w1oU80
	 2st/aYNTueNBjIKnKGsIiPjhxBEghNZkjev4QUqQXNm+fDLo8xNg0p2feEbhoBCehk
	 IdO9Daezu7d+a8ozfQfq7Lsouz4vzY1+XNs6bltPkr0XrGbc2jAGT4xfznVWv+B004
	 wUcuO/2Dn+Nyhl8uNhmW07d0ij3IkSy35vfgJjbN6vwRsMarsGWwOxP3EZeqoUlSNp
	 zJJ2gZCz/qsgQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sat, 06 Dec 2025 08:19:09 -0500
Subject: [PATCH] printf: add __printf attribute
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zXMQQqDMBBA0avIrBtIIir2KtKFxomOhSiTUQTx7
 sYWl2/x/wERmTDCOzuAcaNIc0gwrwzc2IYBFfXJYLUtjNWlWpiCePVdA8mDVoSVqfOy9q6oOq8
 h5Qujp/23bj5/x7Wb0Mn9g/O8AMkLmTZ8AAAA
X-Change-ID: 20251206-printf-kunit-printf-attr-19369fc57bf0
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
 oe-kbuild-all@lists.linux.dev, Tamir Duberstein <tamird@gmail.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1765027170; l=968;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=e5F37dr2wfaldpekfqUwZx+AF4xxA3CEjbLAHNs7ppo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHPjzcTvXazbI7Hl8aCqniNXVOdp72RN+z+TTnXuPBSuGzRyc+2YxWQApTCcV3kSH4gM0jnGoXY
 m4VNzjdRM6QE=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

This produces better diagnostics when incorrect inputs are passed.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512061600.89CKQ3ag-lkp@intel.com/
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 lib/tests/printf_kunit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index 7617e5b8b02c..13e2e9afae3b 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -266,7 +266,7 @@ hash_pointer(struct kunit *kunittest)
 	KUNIT_EXPECT_MEMNEQ(kunittest, buf, PTR_STR, PTR_WIDTH);
 }
 
-static void
+static void __printf(2, 3)
 test_hashed(struct kunit *kunittest, const char *fmt, const void *p)
 {
 	char buf[PLAIN_BUF_SIZE];

---
base-commit: 559e608c46553c107dbba19dae0854af7b219400
change-id: 20251206-printf-kunit-printf-attr-19369fc57bf0

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

