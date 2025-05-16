Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EEB233704
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 10:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389757; cv=none; b=RSBjO3qogN7ZVdICqNJ6sine3yiYZDBStmHy55npt/4vaDBKzby+Qvf4jBfFvBCMmWzfJAFhNDqAIBaeo496hKyAq0iMVLZKo2x6yabtBEAwThSNZf4sshGiqcFA0J36t+ZoSBSiggfJ9ecShzjRauAGLtHHt4j68A8fV8UPw8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389757; c=relaxed/simple;
	bh=N8pVf6uPVWHrmuSPndy18RwQszdKatoUxiYz3Fvo4PY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlYp3pnI3aKu7lNSTs4VJOATfqXKKIAeCCVRAH+qY0eGchql5Re3ojpy5vgjJFCM878AGQCZVPIB+qGGnoHpLpln4ZQvbnWTJjbrRDCQwtAVC83G+ncWFhsbXDGYNuNyEQ60RuV5xuMVOJf9C9gZQ1Mt66CoWamynyDL30q6bJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T4oAqCY7; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T4oAqCY7"
Message-ID: <dcb8c986-b6ec-4803-aa88-2ef2670a6b10@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747389727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N8pVf6uPVWHrmuSPndy18RwQszdKatoUxiYz3Fvo4PY=;
	b=T4oAqCY7nXZIFXf/G8yg6HFZ7L7lDx0X8A/rDoxJXGmD/vPbAaZMsnB43dQL8z64jLBFHt
	sn8g3cvnULvd3/MXPRNoVDYtKxDqxUVHqyrXLLcBPSS9Xnumf7iR/ORR2MEeh+dr69maR1
	B3YkE7+nondMuWWTn0rdvA2LI34iCM4=
Date: Fri, 16 May 2025 18:01:48 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [lwn:docs-next 37/72] htmldocs: Warning:
 Documentation/translations/zh_CN/how-to.rst references a file that doesn't
 exist: Documentation/xxx/xxx.rst
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
 Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>
References: <202505160627.WtzIIpL6-lkp@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <202505160627.WtzIIpL6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi robot,

在 5/16/25 7:04 AM, kernel test robot 写道:
> Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst

I didn't reproduce this warning locally. It seems to be a difference

between different versions of Sphinx.

Could you please provide your Sphinx version?

^^^^^^^^^^^^^^^^^

+译文格式要求
+------------
+
+    - 每行长度最多不超过40个字符
+    - 每行长度请保持一致
+    - 标题的下划线长度请按照一个英文一个字符、一个中文两个字符与标题对齐
+    - 其它的修饰符请与英文文档保持一致
+
+此外在译文的头部，您需要插入以下内容::
+
+    .. SPDX-License-Identifier: GPL-2.0
+    .. include:: ../disclaimer-zh_CN.rst  #您需要了解该文件的路径，根
+                        据您实际翻译的文档灵活调整
+
+    :Original: Documentation/xxx/xxx.rst  #替换为您翻译的英文文档路径
+
+    :翻译:
+
+     司延腾 Yanteng Si <si.yanteng@linux.dev> #替换为您自己的联系方式
+
+翻译技巧
+--------
+
+中文文档有每行40字符限制，因为一个中文字符等于2个英文字符。但是社区并没有

^^^^^^^^^^^^^^^^^^^


I think my grammar is fine. Does anyone know what's going on?


Thanks,

Yanteng



