Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B7F2CA5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 21:24:33 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id a17-20020a256611000000b00889c54916f2so17159947ybc.14
        for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 13:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hEcVIMvG9yiLGQ7yL2dMbIxVRJjfiraajEKz9YRnmwc=;
        b=stBFlXGMBpLXEMGP+A5HDLlzOo/VqEEpVRD6dPu2S69FUOW1+jatHj+xAlVNyNgRst
         kZ6S6qtOnvmg9SSeL9feCU/tTFzJienpYNF7eQVZiZzcCIZHtgfv77dEXLWhl9bNi8Ro
         O8I903X3OAgKsrs/jjszGFWemIIz1AbLw6PwlWtHMVcxle6+GST8TmXUx38oRxPUXr9w
         lua7lBjPr2ZP8RllYAQG8otCNkUYolCzfH4/A6DqLRNFWR6bzOODH8nWghUnqP37UUAt
         /bq265eUYxH7yhxqy7qHIraS1jl2UzC4uJWTW3BfAvqsHyCq4y1jgXFbnPZscSAa0hef
         i9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hEcVIMvG9yiLGQ7yL2dMbIxVRJjfiraajEKz9YRnmwc=;
        b=Lelc9CJiPVoI29dc/ehKkjWvdQYexC2uJPIFDOVMv5yrsdhwt4Z/RUn7hXbKRGaWIS
         JRkGKMUFLFQxuTyr/vKU7h8Gb/NhnDTzAEmdeQk66Clr2ViUWOfbK/+H1koGZnL9Xivx
         wA9Uu/WuwC2G6E3eUDus91Ds1jz3pBLfWsyAhZjQgK4qf1J79hhtNYz3xYaJdk5VkCOv
         JRAEYGpw/EJ/hO4JRoIxuSmeK38rgFmGbDS2h8tUm7C8NcRYT7MldWT3dACxI7zbPMS6
         xkn+r+HQ1/15qypTLdXSjiJOvGrhPP9rv62V2OjPY9AAmKGZmKnm4li7ZQCBKrWBaoX5
         3Wwg==
X-Gm-Message-State: AO0yUKU5gdl+OopWdagDL4+0Q6Oqn3uA4HfDnXjrN/AAfzhTrWF6qRse
	yzvb0ePoWlvaF4fezCrFqItsxZFhrvH4ATMw
X-Google-Smtp-Source: AK7set/S5jWby/Wn6YLGRxTgowQe+yYBkLF/u4giGyVur6aeQCzfkY36ZoyctyfxI8gIR+cqgZccLmAtuzw69fbx
X-Received: from zenghuchen.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2448])
 (user=zenghuchen job=sendgmr) by 2002:a5b:381:0:b0:8f2:bff4:f074 with SMTP id
 k1-20020a5b0381000000b008f2bff4f074mr9162ybp.190.1676409872359; Tue, 14 Feb
 2023 13:24:32 -0800 (PST)
Date: Tue, 14 Feb 2023 16:24:29 -0500
In-Reply-To: <202302141029.2CS1z9de-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202302141029.2CS1z9de-lkp@intel.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230214212429.1157315-1-zenghuchen@google.com>
Subject: Re: Re: [PATCH] i3c: update dw-i3c-master i3c_clk_cfg function
From: Jack Chen <zenghuchen@google.com>
To: lkp@intel.com
Cc: alexandre.belloni@bootlin.com, jesussanp@google.com, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	markslevinsky@google.com, oe-kbuild-all@lists.linux.dev, 
	zenghuchen@google.com
Content-Type: text/plain; charset="UTF-8"

Thanks Intel kernel test robot. This patch was meant for i3c tree.
And I have submitted a new V2 patch which replaced max with max_t to do the type cast.
