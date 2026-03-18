Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.229.168.213])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDFA3D3CF8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 12:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.229.168.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836032; cv=none; b=XgDLpFC7CsYgHnbN7E7QujYhYxnBTSTnxIipMquQSDovHdvBUwYxDYo5V1toMDAC3x75aWjW+cj0Ap+u02pL1PbVUW07ctkmaAbzKWDIUBT3g8kZlm5L1eIEtU4rhBad0Qp7tWEbrMfU1FhW/BW4AvnpT/NxWmx6nh5Jlq3LgmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836032; c=relaxed/simple;
	bh=8laRjiE4HzLcXsKRMt4aGsMSnCu6vSr0HhQ8uApgaWk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=s6vzVHZStNNZKHoRr64smFY68TLHGvUbvYHeq2CXlnFpFcHb5rDOI+0Vuw1lFxM+eV0fqlqhgEgso708FOYetQ6SLk1ou5wdkNKduVvE2zsgWyiZd9Td+5hW5ScZg3OW9WF30L1VKzFz0KhHZePMPyv/VWOVwUqmB1aA1Zp3F7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=52.229.168.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from zhangsenchuan$eswincomputing.com ( [10.12.96.83] ) by
 ajax-webmail-app2 (Coremail) ; Wed, 18 Mar 2026 20:13:32 +0800 (GMT+08:00)
Date: Wed, 18 Mar 2026 20:13:32 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: zhangsenchuan <zhangsenchuan@eswincomputing.com>
To: "Manivannan Sadhasivam" <mani@kernel.org>
Cc: "kernel test robot" <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	"Yu Ning" <ningyu@eswincomputing.com>,
	"Yanghui Ou" <ouyanghui@eswincomputing.com>
Subject: Re: Re: [linux-next:master 5071/6828]
 drivers/pci/controller/dwc/pcie-eswin.c:381:1: sparse: sparse: symbol
 'eswin_pcie_pm' was not declared. Should it be static?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <ossm446mzzxxkd6mzhzdtkdha2fhsqbc33iye5raugsrdesj4d@r6vkmxqlzid2>
References: <202603180642.1rALz4hC-lkp@intel.com>
 <544bb65e.4518.19cff2ac14f.Coremail.zhangsenchuan@eswincomputing.com>
 <ossm446mzzxxkd6mzhzdtkdha2fhsqbc33iye5raugsrdesj4d@r6vkmxqlzid2>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <ff9398.4575.19d00dd8c2f.Coremail.zhangsenchuan@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID:TQJkCgDH3aDslrppi50JAA--.2522W
X-CM-SenderInfo: x2kd0wpvhquxxxdqqvxvzl0uprps33xlqjhudrp/1tbiAgEKBmm5g
	okelQABse
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiA+ID4gU3ViamVjdDogW2xpbnV4LW5leHQ6bWFzdGVyIDUwNzEvNjgyOF0gZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpZS1lc3dpbi5jOjM4MToxOiBzcGFyc2U6IHNwYXJzZTogc3ltYm9s
ICdlc3dpbl9wY2llX3BtJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+
ID4gPiAKPiA+ID4gdHJlZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0IG1hc3Rlcgo+ID4gPiBoZWFkOiAgIDhlNWE0
NzhiNmQ2YTViYjBhM2Q1MjE0Nzg2MmIxNWU0ZDgyNmFmMTkKPiA+ID4gY29tbWl0OiBjYmJlNTlm
YTA0YjVkOWY4ZTExMTM4ZGY0NTkxNjUzZjdkMmY4MzUxIFs1MDcxLzY4MjhdIFBDSTogQWRkIEVT
V0lOIFBDSWUgUm9vdCBDb21wbGV4IGRyaXZlcgo+ID4gPiBjb25maWc6IHNwYXJjNjQtcmFuZGNv
bmZpZy1yMTIyLTIwMjYwMzE4IChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hp
dmUvMjAyNjAzMTgvMjAyNjAzMTgwNjQyLjFyQUx6NGhDLWxrcEBpbnRlbC5jb20vY29uZmlnKQo+
ID4gPiBjb21waWxlcjogc3BhcmM2NC1saW51eC1nY2MgKEdDQykgMTEuNS4wCj4gPiA+IHNwYXJz
ZTogdjAuNi41LXJjMQo+ID4gPiByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOiAoaHR0
cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjYwMzE4LzIwMjYwMzE4MDY0
Mi4xckFMejRoQy1sa3BAaW50ZWwuY29tL3JlcHJvZHVjZSkKPiA+ID4gCj4gPiA+IElmIHlvdSBm
aXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEg
bmV3IHZlcnNpb24gb2YKPiA+ID4gdGhlIHNhbWUgcGF0Y2gvY29tbWl0KSwga2luZGx5IGFkZCBm
b2xsb3dpbmcgdGFncwo+ID4gPiB8IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4KPiA+ID4gfCBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWti
dWlsZC1hbGwvMjAyNjAzMTgwNjQyLjFyQUx6NGhDLWxrcEBpbnRlbC5jb20vCj4gPiA+IAo+ID4g
PiBzcGFyc2Ugd2FybmluZ3M6IChuZXcgb25lcyBwcmVmaXhlZCBieSA+PikKPiA+ID4gPj4gZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1lc3dpbi5jOjM4MToxOiBzcGFyc2U6IHNwYXJz
ZTogc3ltYm9sICdlc3dpbl9wY2llX3BtJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUg
c3RhdGljPwo+ID4gPiAKPiA+ID4gdmltICsvZXN3aW5fcGNpZV9wbSArMzgxIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaWUtZXN3aW4uYwo+ID4gPiAKPiA+ID4gICAgMzgwCQo+ID4gPiAg
PiAzODEJREVGSU5FX05PSVJRX0RFVl9QTV9PUFMoZXN3aW5fcGNpZV9wbSwgZXN3aW5fcGNpZV9z
dXNwZW5kX25vaXJxLAo+ID4gPiAgICAzODIJCQkJZXN3aW5fcGNpZV9yZXN1bWVfbm9pcnEpOwo+
ID4gPiAgICAzODMJCj4gPiA+IAo+ID4gPiAtLSAKPiA+ID4gMC1EQVkgQ0kgS2VybmVsIFRlc3Qg
U2VydmljZQo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGtwLXRlc3RzL3dpa2kKPiA+
IAo+ID4gSGkgTWFuaSwKPiA+IAo+ID4gVGhlIGtlcm5lbCB0ZXN0IHJvYm90IGRldGVjdGVkIGEg
d2FybmluZy4gSSByZXByb2R1Y2VkIHRoZSBpc3N1ZSBhbmQgaXQgc2VlbXMgCj4gPiB0aGF0IGEg
InN0YXRpYyIga2V5d29yZCBtaWdodCBiZSBuZWVkZWQuIEknbSBub3Qgc3VyZSBpZiBJIGhhdmUg
dGhlIHBlcm1pc3Npb24KPiA+IHRvIHVwbG9hZCB0aGUgY29kZSB0byB0aGUgY29udHJvbGxlci9k
d2MtZXN3aW4gYnJhbmNoIGFuZCBmaXggdGhpcyB3YXJuaW5nOgo+ID4gCj4gPiAKPiA+IAo+ID4g
LURFRklORV9OT0lSUV9ERVZfUE1fT1BTKGVzd2luX3BjaWVfcG0sIGVzd2luX3BjaWVfc3VzcGVu
ZF9ub2lycSwKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAgZXN3aW5fcGNpZV9yZXN1bWVfbm9pcnEpOwo+ID4gCj4gPiArc3RhdGljIERFRklORV9OT0lS
UV9ERVZfUE1fT1BTKGVzd2luX3BjaWVfcG0sIGVzd2luX3BjaWVfc3VzcGVuZF9ub2lycSwKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICBlc3dpbl9wY2llX3Jlc3VtZV9ub2lycSk7Cj4gCj4gRml4ZWQgaXQgaW4gdGhlIHRyZWUs
IHRoYW5rcyEKPiAKClNpbWlsYXJseSwgVGhhbmtzIGZvciB5b3VyIHN1cHBvcnQhCgpLaW5kIHJl
Z2FyZHMsClNlbmNodWFuCgoK
