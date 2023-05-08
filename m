Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CA65CB0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 05:17:19 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3064099f9b6so2467078f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 07 May 2023 22:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683523038; x=1686115038;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9KYglp3kw7swqe4P9gBCkBVoMI7DDROvV1rnisE0mxc=;
        b=zbK76cthw6CpCDBJzpd77slGZkZq3JjiRcPjRULAAL8HgCYthR8xC2M33ADWM1HN5H
         bErWByPxkfRelooRQKPzfWcyKDPwfPJKTmDjapz9+h91VraBDGhWv/YBnw+ETp5gyhhE
         0XWP0VE+gOXav1vDlHELm4Q1jg3xALGjhzZvKhsWAkGIec24aOuTg3DMCw9kBoFjen8p
         TSdMMMtDsRr4w+4ivjNeqd9dLHSy7YdgzWzBsL3w/S+AQonkflh9WUE3S7Oy7EIojggH
         rfdrTZDlKfnqsmnHVcLhJUisni+8t5Ab3tdD6ZLVzhX+bFLx3cKYlTyoH4ggrpO2Tmj5
         xtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683523038; x=1686115038;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9KYglp3kw7swqe4P9gBCkBVoMI7DDROvV1rnisE0mxc=;
        b=PBH3ML9PUUAXAAvhaII4LAiQFnzxB0WWMk2ugnDbLWm6HR8zpCPt6IA7FlrsAdRoul
         4czt/RQdg94DtJrk1YksyJBsU9nTGhlo3ljnmpXlyVwZqngQbCTwZ47J96Q4ta5gDuXe
         XSOb3/FcEbJ6DqqL9ZK+invoPllVCEv305uHH6qPaDRuHEFdVQmZ6t5sSfxI55nL4e32
         f2/yHvo6BGYYR/j3FZVOIk6HnG4mzMX7E6i84JjGYON8NmawR+MjZhSSold1R6Xv0WqN
         1crq7pVBicmIDn06tXCeJ/VOJrRUpfkBDu3iRrwuW7oAf+0iBStGFDtFIVgix9EoyHMJ
         jbsA==
X-Gm-Message-State: AC+VfDz0CbMBuqGNRK+K6r+Wu+FyXMZIy23rvpRdEz4YuVca9SsGumS+
	OA+uKROZKR+IoZONJWR8Zf0JJg==
X-Google-Smtp-Source: ACHHUZ5imPXkgCHamZWK6HDTNjnpkkYezN5qeMQCNrna9YvUZ7mATrotlYjZfOei6vh6ZMcqPcPpmg==
X-Received: by 2002:adf:db0c:0:b0:307:9d2a:fd35 with SMTP id s12-20020adfdb0c000000b003079d2afd35mr86070wri.53.1683523038026;
        Sun, 07 May 2023 22:17:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r15-20020a5d694f000000b00306415ac69asm10047173wrw.15.2023.05.07.22.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 22:17:15 -0700 (PDT)
Date: Mon, 8 May 2023 08:17:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/fprobe.c:59 fprobe_handler() error: uninitialized
 symbol 'ret'.
Message-ID: <d3467332-3d5f-488a-b156-064cbd3d7873@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2e1e1337881b0e9844d687982aa54b31b1269b11
commit: 39d954200bf6ad503c722e44d0be80c7b826fa42 fprobe: Skip exit_handler if entry_handler returns !0
config: i386-randconfig-m041-20230501 (https://download.01.org/0day-ci/archive/20230506/202305061702.6h3JzCPA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305061702.6h3JzCPA-lkp@intel.com/

smatch warnings:
kernel/trace/fprobe.c:59 fprobe_handler() error: uninitialized symbol 'ret'.

vim +/ret +59 kernel/trace/fprobe.c

cad9931f64dc7f Masami Hiramatsu          2022-03-15  23  static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
cad9931f64dc7f Masami Hiramatsu          2022-03-15  24  			   struct ftrace_ops *ops, struct ftrace_regs *fregs)
cad9931f64dc7f Masami Hiramatsu          2022-03-15  25  {
5b0ab78998e325 Masami Hiramatsu          2022-03-15  26  	struct fprobe_rethook_node *fpr;
76d0de5729c056 Masami Hiramatsu (Google  2023-02-02  27) 	struct rethook_node *rh = NULL;
cad9931f64dc7f Masami Hiramatsu          2022-03-15  28  	struct fprobe *fp;
76d0de5729c056 Masami Hiramatsu (Google  2023-02-02  29) 	void *entry_data = NULL;
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02  30) 	int bit, ret;
cad9931f64dc7f Masami Hiramatsu          2022-03-15  31  
cad9931f64dc7f Masami Hiramatsu          2022-03-15  32  	fp = container_of(ops, struct fprobe, ops);
cad9931f64dc7f Masami Hiramatsu          2022-03-15  33  	if (fprobe_disabled(fp))
cad9931f64dc7f Masami Hiramatsu          2022-03-15  34  		return;
cad9931f64dc7f Masami Hiramatsu          2022-03-15  35  
cad9931f64dc7f Masami Hiramatsu          2022-03-15  36  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
cad9931f64dc7f Masami Hiramatsu          2022-03-15  37  	if (bit < 0) {
cad9931f64dc7f Masami Hiramatsu          2022-03-15  38  		fp->nmissed++;
cad9931f64dc7f Masami Hiramatsu          2022-03-15  39  		return;
cad9931f64dc7f Masami Hiramatsu          2022-03-15  40  	}
cad9931f64dc7f Masami Hiramatsu          2022-03-15  41  
5b0ab78998e325 Masami Hiramatsu          2022-03-15  42  	if (fp->exit_handler) {
5b0ab78998e325 Masami Hiramatsu          2022-03-15  43  		rh = rethook_try_get(fp->rethook);
5b0ab78998e325 Masami Hiramatsu          2022-03-15  44  		if (!rh) {
5b0ab78998e325 Masami Hiramatsu          2022-03-15  45  			fp->nmissed++;
5b0ab78998e325 Masami Hiramatsu          2022-03-15  46  			goto out;
5b0ab78998e325 Masami Hiramatsu          2022-03-15  47  		}
5b0ab78998e325 Masami Hiramatsu          2022-03-15  48  		fpr = container_of(rh, struct fprobe_rethook_node, node);
5b0ab78998e325 Masami Hiramatsu          2022-03-15  49  		fpr->entry_ip = ip;
76d0de5729c056 Masami Hiramatsu (Google  2023-02-02  50) 		if (fp->entry_data_size)
76d0de5729c056 Masami Hiramatsu (Google  2023-02-02  51) 			entry_data = fpr->data;
5b0ab78998e325 Masami Hiramatsu          2022-03-15  52  	}
5b0ab78998e325 Masami Hiramatsu          2022-03-15  53  
76d0de5729c056 Masami Hiramatsu (Google  2023-02-02  54) 	if (fp->entry_handler)
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02  55) 		ret = fp->entry_handler(fp, ip, ftrace_get_regs(fregs), entry_data);
76d0de5729c056 Masami Hiramatsu (Google  2023-02-02  56) 
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02  57) 	/* If entry_handler returns !0, nmissed is not counted. */
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02  58) 	if (rh) {
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02 @59) 		if (ret)

I reported this one earlier.  The code assumes that if there is an
-exit_handler there is also an ->entry_handler().  You had said you
would just initialized ret = 0;

39d954200bf6ad Masami Hiramatsu (Google  2023-02-02  60) 			rethook_recycle(rh);
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02  61) 		else
76d0de5729c056 Masami Hiramatsu (Google  2023-02-02  62) 			rethook_hook(rh, ftrace_get_regs(fregs), true);
39d954200bf6ad Masami Hiramatsu (Google  2023-02-02  63) 	}
5b0ab78998e325 Masami Hiramatsu          2022-03-15  64  out:
cad9931f64dc7f Masami Hiramatsu          2022-03-15  65  	ftrace_test_recursion_unlock(bit);
cad9931f64dc7f Masami Hiramatsu          2022-03-15  66  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

