Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A985C51
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 18:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713293081; cv=none; b=A79ngv552b82kL42zJUCmRAisZeMBx4+o1ch+jsOqOTAUs/SMxUyM8FyrQgTDpLttiQ61WiFu6Z2CoXAoODsBPSXdtuZLZjKTAfiU1l1XoG7Lv6vd0U1Q9J627X40n/PrFsDTKoKyLGJDJBBu5FleBy7vhHmS16NnN9AXH9gcr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713293081; c=relaxed/simple;
	bh=PfVSCPLedtUiAlqhfWLQnECZx0MQcYJs85YdER9mbtQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TctmXib7p0BOZuNw94Lg1MtXLxVmpaxNJ9TB027X0M2Ug8jqIjnyx5S3FOqkYcfCqyks2YSdzUp+2SrHUWK41Qx75ancz6YYSxA1Ko//1wJfU2L9OEMPM0ym02rvhcCqnpqjDHVmkMIcQjAJ2bfpsIA+wRgjWgrAA4pKNNX+1U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zuU2FIVF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zuU2FIVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D32AC113CE;
	Tue, 16 Apr 2024 18:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1713293080;
	bh=PfVSCPLedtUiAlqhfWLQnECZx0MQcYJs85YdER9mbtQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zuU2FIVFHSjHsUiTAdIzo8HgZPDKr3Mnh5prwnAv5vMaRzQxJWSPV+J4GrMU+dwS1
	 NQQEyGYYsGkJrNM1QRzdslhvdWiV3p2+F8RYZirM76Xs3qVbozpO2mwnZQVfeC+h6i
	 D5eBijVqLO9S7+Riuj7ynQwaaeygognYhKyW9H8o=
Date: Tue, 16 Apr 2024 11:44:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <yujie.liu@intel.com>
Cc: Edward Liaw <edliaw@google.com>, <oe-kbuild-all@lists.linux.dev>, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 5507/6266] ../kselftest_harness.h:1167:9:
 warning: ignoring return value of 'asprintf' declared with attribute
 'warn_unused_result'
Message-Id: <20240416114439.038054b9c33986a13f4757c7@linux-foundation.org>
In-Reply-To: <202404161023.K0EsnDmF-lkp@intel.com>
References: <202404161023.K0EsnDmF-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Apr 2024 14:35:18 +0800 kernel test robot <yujie.liu@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6bd343537461b57f3efe5dfc5fc193a232dfef1e
> commit: c19377e23d4cb45f69c5d226ae3436f7fa818c8f [5507/6266] selftests/harness: remove use of LINE_MAX
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161023.K0EsnDmF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Closes: https://lore.kernel.org/r/202404161023.K0EsnDmF-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from tls.c:24:
>    ../kselftest_harness.h: In function '__run_test':
> >> ../kselftest_harness.h:1167:9: warning: ignoring return value of 'asprintf' declared with attribute 'warn_unused_result' [-Wunused-result]
>     1167 |         asprintf(&test_name, "%s%s%s.%s", f->name,
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     1168 |                  variant->name[0] ? "." : "", variant->name, t->name);
>          |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Thanks.  How does this look?

--- a/tools/testing/selftests/kselftest_harness.h~selftests-harness-remove-use-of-line_max-fix-fix
+++ a/tools/testing/selftests/kselftest_harness.h
@@ -1163,8 +1163,12 @@ void __run_test(struct __fixture_metadat
 	t->trigger = 0;
 	memset(t->results->reason, 0, sizeof(t->results->reason));
 
-	asprintf(&test_name, "%s%s%s.%s", f->name,
-	         variant->name[0] ? "." : "", variant->name, t->name);
+	if (asprintf(&test_name, "%s%s%s.%s", f->name,
+		variant->name[0] ? "." : "", variant->name, t->name) == -1) {
+		ksft_print_msg("ERROR ALLOCATING MEMORY\n");
+		t->exit_code = KSFT_FAIL;
+		_exit(t->exit_code);
+	}
 
 	ksft_print_msg(" RUN           %s ...\n", test_name);
 
_

