Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D2E1117
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 13:27:30 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:53354)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1qklJB-000p2h-Lt; Mon, 25 Sep 2023 07:07:29 -0600
Received: from ip68-227-168-167.om.om.cox.net ([68.227.168.167]:47200 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1qklJA-008TT1-Ig; Mon, 25 Sep 2023 07:07:29 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: kernel test robot <lkp@intel.com>
Cc: stable@vger.kernel.org,  oe-kbuild-all@lists.linux.dev
References: <ZRGEZcVhvI2YKx2/@845c4ce01481>
Date: Mon, 25 Sep 2023 08:07:21 -0500
In-Reply-To: <ZRGEZcVhvI2YKx2/@845c4ce01481> (kernel test robot's message of
	"Mon, 25 Sep 2023 21:00:21 +0800")
Message-ID: <87a5tammeu.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1qklJA-008TT1-Ig;;;mid=<87a5tammeu.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.168.167;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1/5pqfAVKwh7eCQGzbtGPJyQrycv0htxxw=
X-SA-Exim-Connect-IP: 68.227.168.167
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,XMSubLong,XM_Multi_Part_URI
	shortcircuit=no autolearn=disabled version=3.4.2
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4402]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	*  1.2 XM_Multi_Part_URI URI: Long-Multi-Part URIs
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;kernel test robot <lkp@intel.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 523 ms - load_scoreonly_sql: 0.05 (0.0%),
	signal_user_changed: 12 (2.2%), b_tie_ro: 10 (2.0%), parse: 1.09
	(0.2%), extract_message_metadata: 18 (3.5%), get_uri_detail_list: 2.2
	(0.4%), tests_pri_-2000: 15 (2.9%), tests_pri_-1000: 3.4 (0.6%),
	tests_pri_-950: 1.77 (0.3%), tests_pri_-900: 1.46 (0.3%),
	tests_pri_-200: 1.24 (0.2%), tests_pri_-100: 14 (2.7%), tests_pri_-90:
	230 (44.0%), check_bayes: 218 (41.6%), b_tokenize: 9 (1.7%),
	b_tok_get_all: 6 (1.1%), b_comp_prob: 2.7 (0.5%), b_tok_touch_all: 196
	(37.5%), b_finish: 1.03 (0.2%), tests_pri_0: 161 (30.7%),
	check_dkim_signature: 0.48 (0.1%), check_dkim_adsp: 2.9 (0.6%),
	poll_dns_idle: 0.37 (0.1%), tests_pri_10: 3.1 (0.6%), tests_pri_500:
	57 (10.8%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] binfmt_elf: Support segments with 0 filesz and
 misaligned starts
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)

kernel test robot <lkp@intel.com> writes:

> Hi,
>
> Thanks for your patch.
>
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
>
> The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1
>
> Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
> Subject: [PATCH] binfmt_elf: Support segments with 0 filesz and misaligned starts
> Link: https://lore.kernel.org/stable/87jzsemmsd.fsf_-_%40email.froward.int.ebiederm.org

My apologies kernel test robot I had realized stable was cc'd on this
conversation.

This patch as is, is most definitely not stable fodder.  Maybe after
being tested.  It is definitely not a regression fix, and I am not
certain even after being tested it could be considered a fix rather than
just a new feature. AKA "Support very weird compiler generated
exectuables".

Eric
